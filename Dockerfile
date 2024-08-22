# syntax=docker/dockerfile:1

FROM ruby:3.3.4-bullseye
WORKDIR /app
COPY . .

RUN gem install bundler
RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
