# syntax=docker/dockerfile:1

FROM ruby:3.1.2
RUN apt-get update -qq
WORKDIR /app
COPY . /app
RUN bundle install


COPY clear-process.sh /usr/bin
RUN chmod +x /usr/bin/clear-process.sh
ENTRYPOINT ["clear-process.sh"]
EXPOSE 3000


CMD bundle exec rails server 