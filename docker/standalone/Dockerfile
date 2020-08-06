FROM ruby:2.4.1

ENV TZ=America/Argentina
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata nodejs libmysqlclient-dev

ARG RAILS_FOLDER

RUN git clone https://github.com/bitex-la/compliance.git ${RAILS_FOLDER} \
    && cp ${RAILS_FOLDER}/docker/standalone/settings.yml ${RAILS_FOLDER}/config/settings.yml

EXPOSE 5000

WORKDIR ${RAILS_FOLDER}