FROM ruby:3.3.0-bookworm

WORKDIR /app/simbrain

COPY src/Gemfile /app/simbrain
COPY src/Gemfile.lock /app/simbrain

RUN gem install bundler
RUN bundle install

CMD ["bash", "dev-server.sh"]