FROM ruby:2.5-alpine

RUN apk add --update --no-cache \
    build-base \
    libxml2-dev \
    libxslt-dev \
    curl \
    bash

# Make a directory for test suite
RUN mkdir /home/WebRubyAutomationTest
WORKDIR /home/WebRubyAutomationTest

# Install the dependencies
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

# Copy test suite
ADD . /home/WebRubyAutomationTest

# Run tests
RUN bundle exec cucumber