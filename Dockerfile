FROM ruby:3

RUN apt-get update -qq && apt-get install -y nodejs

ENV APP_HOME /rails-jwt
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile Gemfile.lock $APP_HOME/
RUN bundle install
ADD . $APP_HOME/
