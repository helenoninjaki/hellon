

FROM ubuntu:18.04

LABEL maintainer="Prakhar Srivastav <prakhar@prakhar.me>"


RUN apt-get -yqq update
RUN apt-get -yqq install python3-pip python3-dev curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -yq nodejs

ADD flask-app /opt/flask-app
WORKDIR /opt/flask-app


RUN npm install
RUN npm run build
RUN pip3 install -r requirements.txt


EXPOSE 5000


CMD [ "python3", "./hellon.py" ]
