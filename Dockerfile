FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /docker_app
WORKDIR /docker_app
COPY Gemfile /docker_app/Gemfile
COPY Gemfile.lock /docker_app/Gemfile.lock
RUN gem install bundler -v 2.0.1
RUN bundle install
RUN bundle update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
COPY . /docker_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
