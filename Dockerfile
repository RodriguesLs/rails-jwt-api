FROM ruby:3

RUN apt-get update -qq && apt-get install -y nodejs && gem install bundler:2.2.7

ENV APP_HOME /rails-jwt
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile Gemfile.lock $APP_HOME/
RUN bundle install
ADD . $APP_HOME/
