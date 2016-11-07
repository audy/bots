FROM ruby:2.3.1-onbuild

WORKDIR /bot

ADD . /bot

ENV LANG en_US.UTF-8

RUN bundle install

ENTRYPOINT ["bundle", "exec", "ruby", "twitter.rb"]
