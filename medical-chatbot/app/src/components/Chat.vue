<template>
  <div class="container-vertical-center">
    <div class="container">

      <!-- Login UI -->
      <template v-if="user.username === ''">
        <div class="card p-3" style="max-width: 250px; margin: auto;">
          <form @submit.prevent="setUsername">

            <div class="form-group">
              <input
                ref="setUsernameInput"
                type="text"
                class="form-control"
                placeholder="Create new username"
                required>
            </div>

            <button
              type="submit"
              class="btn btn-block btn-primary"
              >OK</button>

          </form>
        </div>
      </template>

      <!-- Chat UI -->
      <template v-else>
        <div id="chat-container" class="card">
          <div class="card-header font-weight-bold bg-light text-dark">
            <span class="float-left" style="font-size: 15pt;">{{ room.name }}</span>
            <span class="btn-sm btn-light float-right">Average ping latency: <span v-html="pingLatency"></span></span>
          </div>

          <div class="card-body">
            <div class="container chat-body pt-2 pb-2" ref="chatBody">
              <div v-for="message in messages" :key="message.id" class="row chat-section">
                <template v-if="user.username === message.username">
                  <div class="col-sm-12">

                    <span class="card-text speech-bubble speech-bubble-user float-right text-white bg-primary">
                      <span v-html="message.message"></span>
                    </span>

                  </div>
                </template>
                <template v-else-if="'Server' === message.username">
                  <div class="col-sm-12">

                    <span class="speech-bubble text-center text-dark" v-html="message.message" style="background-color: #eee; font-size: 12pt; padding:5px 15px;"></span>

                  </div>
                </template>
                <template v-else>
                  <div class="col-sm-12">

                    <span class="card-text speech-bubble speech-bubble-peer float-left text-white bg-dark">
                      <b style="font-size: 0.75em;">{{ message.username }}</b><br>
                      <span v-html="message.message"></span>
                    </span>

                  </div>
                </template>
              </div>
            </div>
          </div>
          <div class="card-footer text-muted">
            <form @submit.prevent="sendMessage">

              <div><input v-model="messageInput" type="text" style="height: 50px;" placeholder="Tulis pesanmu..."></div>

            </form>
          </div>
        </div>
      </template>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      room: { name: 'Kesehatan #1' },
      user: { username: '' },
      messages: [],
      messageInput: '',
      isConnected: false,
      pingLatency: 'NaN'
    }
  },
  created () {
    // window.addEventListener('beforeunload', this.beforeWindowUnload)
  },
  updated () {
    // Scroll chat window to the recent message from the user
    var chatLength = this.messages.length
    if (chatLength > 0) {
      if (this.messages[chatLength - 1].username === this.user.username) {
        const chatBody = this.$refs.chatBody
        if (chatBody) {
          chatBody.scrollTop = chatBody.scrollHeight
        }
      }
    }
  },
  beforeRouteLeave () {
    window.removeEventListener('beforeunload', this.beforeWindowUnload)
  },
  beforeUnmount () {
    window.removeEventListener('beforeunload', this.beforeWindowUnload)
  },
  sockets: {
    connect () {
      this.isConnected = true
    },
    disconnect () {
      this.isConnected = false
    },
    reply (response) {
      // Show a regular message from the server
      this.messages.push(response)
    },
    info (response) {
      // Show an exclusive message from the server
      this.messages.push(response)
    },
    my_pong () {
      // Calculate average PING latency
      this.pingTimes.push((new Date()).getTime() - this.startTime)
      this.pingTimes = this.pingTimes.slice(-30)
      var sum = 0
      for (var i = 0; i < this.pingTimes.length; i++) {
        sum += this.pingTimes[i]
      }
      this.pingLatency = (Math.round(10 * sum / this.pingTimes.length) / 10).toString() + ' ms'
    },
    hi (response) {
      // Show a greeting message from the server
      // only when the user first joins
      if (this.messages.length === 1) {
        this.messages.push(response)
      }
    },
    bye (response) {
      // Show a closing message from the server
      // after the user leave the room
      this.messages.push(response)
      clearInterval(this.pingTimer)
      clearInterval(this.closeTimer)

      // Disconnect from the server
      this.$socket.emit('disconnect')
    }
  },
  methods: {
    joinRoom () {
      // Join the specific room on the server
      this.$socket.emit('join', {
        room: this.room.name,
        username: this.user.username
      })
    },
    setUsername () {
      // Set a username
      if (this.$refs.setUsernameInput.value === '') {
        alert('Username cannot be empty!')
      } else {
        this.user.username = this.$refs.setUsernameInput.value
      }

      this.joinRoom()
      this.createPingTimer()
      this.resetCloseTimer()
    },
    createPingTimer () {
      // Create a timer for PING
      this.pingTimes = []
      this.startTime = null
      this.pingTimer = setInterval(() => {
        this.startTime = (new Date()).getTime()
        this.$socket.emit('my_ping')
      }, 1000)
    },
    resetCloseTimer () {
      // Create a timer to disconnect from the server
      // after the user is inactive within 1 minute
      this.closeTimer = setInterval(() => {
        this.$socket.emit('leave', {
          room: this.room.name,
          username: this.user.username
        })
      }, 60000)
    },
    sendMessage () {
      if (!this.isConnected) {
        // Reconnect to the server
        // when the user has been inactive
        this.$socket.emit('connect')

        // Rejoin the specific room
        this.joinRoom()

        clearInterval(this.pingTimer)
        this.createPingTimer()
      }

      // Send a message from the user to the server
      if (this.messageInput !== '') {
        var data = {
          message: this.messageInput,
          username: this.user.username,
          room: this.room.name
        }
        this.$socket.emit('room_message', data)

        this.messageInput = ''
      }

      clearInterval(this.closeTimer)
      this.resetCloseTimer()
    },
    beforeWindowUnload () {
      // Leave the specific room on the server
      this.$socket.emit('leave', {
        room: this.room.name,
        username: this.user.username
      })

      // Disconnect from the server
      this.$socket.emit('disconnect')

      clearInterval(this.pingTimer)
    }
  }
}
</script>

<style scoped>
#suggestions:empty {
  display: none !important;
}

#suggestions:not(:empty) {
  display: block !important;
}

.card {
  border-radius: 5px !important;
}

.card-footer {
  padding: 0;
}

.card-footer input[type="text"] {
  background-color: #ffffff;
  color: #444444;
  padding: 7px 14px;
  font-size: 15px;
  border: 0;
  width: 100%;
  height: 38px;
}

.card-header a {
  text-decoration: underline;
}

.card-body {
  background-color: #eee;
  padding-left: 0;
  padding-right: 0;
}

.chat-body {
  background-color: #ddd;
  margin-top: -20px;
  margin-bottom: -20px;
  overflow-y: auto;
  height: calc(100vh - 240px);
}

.speech-bubble {
  display: inline-block;
  position: relative;
  border-radius: 20px;
  padding: 10px 20px;
  background-color: #fff;
  font-size: 14pt;
  text-align: left;
  white-space: pre-line;
  max-width: 720px;
}

.speech-bubble-user {
  border-top-right-radius: 0;
  margin-left: 50px;
}

.speech-bubble-peer {
  border-top-left-radius: 0;
  margin-right: 50px;
}

.subtle-blue-gradient {
  background: linear-gradient(45deg, #004bff, #007bff);
}

.chat-section:first-child {
  margin-top: 10px;
}

.chat-section {
  margin-top: 15px;
}

.chat-section:last-child {
  margin-bottom: 10px;
}
.send-section {
  margin-bottom: -20px;
  padding-bottom: 10px;
}

.container-vertical-center {
  background-color: #222;
  min-height: 100vh;
  display: flex;
  align-items: center;
}
</style>
