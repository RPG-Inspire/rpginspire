# builds ruby development stack
FROM ruby:2.6.4-alpine3.10 AS rbbuilder

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

RUN bundle package
RUN bundle install --jobs 20

# builds application production dependencies
FROM ruby:2.6.4-alpine3.10 AS production

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  imagemagick \
  python2 \
  nodejs \
  yarn \
  postgresql-dev && \
  rm -rf /var/cache/apk/*

ARG MASTER_KEY
WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install --jobs 20 --deployment --without development test

ENV RAILS_ENV=production
ENV NODE_ENV=production

ADD package.json .
ADD yarn.lock .

RUN yarn install --prod

ADD . /app
RUN LIVE_DB_CONNECTIONS=false DOCKER_BUILD=true RAILS_GROUPS=assets NODE_ENV=production RAILS_ENV=production RAILS_MASTER_KEY=$MASTER_KEY bundle exec rake assets:precompile

CMD ["bundle", "exec", "puma", "-c", "config/puma.rb"]

