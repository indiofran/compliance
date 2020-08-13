FROM ruby:2.4.1

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Argentina
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata nodejs libmysqlclient-dev

# Install dockerize
RUN cd /tmp \ 
     && wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz \
     && tar -xvzf dockerize-linux-amd64-v0.6.1.tar.gz \
     && rm dockerize-linux-amd64-v0.6.1.tar.gz \
     && mv dockerize  /usr/bin \
     && chmod +x /usr/bin/dockerize

ARG RAILS_FOLDER

EXPOSE 5100

RUN mkdir ${RAILS_FOLDER}
WORKDIR ${RAILS_FOLDER}
COPY Gemfile ${RAILS_FOLDER}
COPY Gemfile.lock ${RAILS_FOLDER}
RUN bundle install
COPY . ${RAILS_FOLDER}