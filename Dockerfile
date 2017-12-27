FROM ruby:2.4.1
MAINTAINER lukasz@horonziak.pl

# Install necesary dependecies
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres & postgis
RUN apt-get install -y libpq-dev libgeos-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev libgmp3-dev

# for papareclip
RUN apt-get install -y imagemagick libav-tools

# for a JS runtime
RUN apt-get install -y nodejs

# for bundler
RUN apt-get install -y git

# Create application directory
RUN mkdir -p /home/app/
WORKDIR /home/app/
RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "bundle config build.nokogiri --use-system-libraries"
COPY Gemfile Gemfile.lock ./
RUN /bin/bash -l -c "bundle install --jobs 20 --retry 5"

ADD . /home/app/
