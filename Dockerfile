FROM            python:3
RUN             mkdir /app
RUN             useradd -d /app roboshop
WORKDIR         /app
RUN             chown roboshop:roboshop /app
USER            roboshop
COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN             pip3 install -r requirements.txt
ENTRYPOINT      ["uwsgi", "--ini", "payment.ini"]
