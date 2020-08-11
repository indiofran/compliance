FROM ruby:2.4.1

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Argentina
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata nodejs libmysqlclient-dev firefox-esr=68.9.0esr-1~deb8u2

# Install geckodriver
RUN cd /tmp \ 
    && wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz \
    && tar -xvzf geckodriver-v0.26.0-linux64.tar.gz \
    && rm geckodriver-v0.26.0-linux64.tar.gz \
    && mv geckodriver /usr/bin \
    && chmod +x /usr/bin/geckodriver

ARG RAILS_FOLDER

RUN mkdir ${RAILS_FOLDER}
WORKDIR ${RAILS_FOLDER}
COPY Gemfile ${RAILS_FOLDER}
COPY Gemfile.lock ${RAILS_FOLDER}
RUN bundle install
COPY . ${RAILS_FOLDER}