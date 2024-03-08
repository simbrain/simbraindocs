FROM ruby:3.3.0-bookworm

WORKDIR /app/simbrain


CMD ["bash", "dev-server.sh"]