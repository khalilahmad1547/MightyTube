FROM mcr.microsoft.com/devcontainers/ruby:1-3.2-bullseye

RUN su vscode -c "gem install rails webdrivers"
RUN su vscode -c "/usr/local/rvm/bin/rvm fix-permissions"

ENV RAILS_DEVELOPMENT_HOSTS="*"

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential \
    git libpq-dev libvips pkg-config curl libvips postgresql-client

RUN su vscode -c "source /usr/local/share/nvm/nvm.sh"
