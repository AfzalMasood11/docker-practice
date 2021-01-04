FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /docker-practice
COPY Gemfile /docker-practice/Gemfile
COPY Gemfile.lock /docker-practice/Gemfile.lock
RUN bundle install
COPY . /docker-practice

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]