FROM ruby:2.6

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

ENV RACK_ENV=development

COPY . /app
