# syntax=docker/dockerfile:1
FROM ruby:3.0.1

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
# Install node 16-LTS and yarn
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
  nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

EXPOSE 4000

COPY . /app
