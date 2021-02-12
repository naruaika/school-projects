from flask import Flask
from flask_socketio import SocketIO, close_room, emit, disconnect, join_room, leave_room

from src.process import qa_pairs


app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app, async_mode='eventlet', cors_allowed_origins='*')


@socketio.on('my_ping')
def ping_pong():
    emit('my_pong')


@socketio.on('join')
def join(message):
    join_room(message['room'])
    # Send info about the user who recently joined the room
    emit('info', {
        'message': message['username'] + ' baru saja bergabung',
        'username': 'Server'
    }, room=message['room'])

    # Send a greeting message to the client
    emit('hi', {
        'message': 'Hai, apa yang ' + message['username'] + ' ingin ketahui hari ini?',
        'username': 'Robot'
    }, room=message['room'])


@socketio.on('leave')
def leave(message):
    # Send a closing message to the client
    emit('bye', {
        'message': 'Sepertinya kamu sudah mau pergi. Jangan ragu untuk bertanya lagi di lain waktu, ya... :)',
        'username': 'Robot'
    }, room=message['room'])

    # Send info about the user who recently left the room
    emit('info', {
        'message': message['username'] + ' baru saja keluar',
        'username': 'Server'
    }, room=message['room'])
    leave_room(message['room'])


@socketio.on('close')
def close(message):
    close_room(message['room'])


@socketio.on('broadcast_message')
def broadcast_message(message):
    # Send a message to all online users
    emit('announcement', {
        'message': message['message'],
        'username': message['username']
    })


@socketio.on('room_message')
def room_message(message):
    # Send the message to all participants in the same room
    emit('reply', {
        'message': message['message'],
        'username': message['username']
    }, room=message['room'])

    # Send a reply to the question
    emit('reply', {
        'message': qa_pairs(message['message']),
        'username': 'Robot'
    }, room=message['room'])


if __name__ == "__main__":
    socketio.run(app, debug=True)
