FROM            redhat/ubi9
RUN             dnf install python3 gcc python3-devel -y
RUN             mkdir /app
RUN             useradd -d /app roboshop
WORKDIR         /app
RUN             chown roboshop:roboshop /app
USER            roboshop
COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN             pip3 install -r requirements.txt
COPY            run.sh newrelic.ini /app/
ENTRYPOINT      ["bash", "/app/run.sh"]