FROM tiangolo/uwsgi-nginx-flask:python3.8

RUN pip install --upgrade pip && \
    pip install --user eventlet==0.30.1 \
    flask-socketio==4.3.2 \
    python-Levenshtein==0.12.2

WORKDIR /app

# COPY . .

# COPY requirements.txt .

# RUN pip install -r requirements.txt

EXPOSE 5000:5000

# CMD ["python", "./main.py"]
