FROM ruby:2.4.1

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Argentina
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata nodejs libmysqlclient-dev

ARG RAILS_FOLDER

EXPOSE 5100

RUN mkdir ${RAILS_FOLDER}
WORKDIR ${RAILS_FOLDER}
COPY Gemfile ${RAILS_FOLDER}
COPY Gemfile.lock ${RAILS_FOLDER}
RUN bundle install
COPY . ${RAILS_FOLDER}
COPY ${RAILS_GUEST_FOLDER}/docker/development/settings.yml ${RAILS_GUEST_FOLDER}/config/settings.yml