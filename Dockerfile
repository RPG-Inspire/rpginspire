FROM ruby:2.6.4-alpine3.10

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  xvfb \
  imagemagick \
  nodejs \
  yarn \
  postgresql-dev && \
  rm -rf /var/cache/apk/*

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

