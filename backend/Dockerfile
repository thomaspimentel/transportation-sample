FROM ruby:2.7

ENV APP_HOME /usr/src/backend

WORKDIR ${APP_HOME}
COPY ./ ${APP_HOME}
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential nodejs
RUN npm install -g yarn
RUN bundle install