FROM ruby:3.2.2
ARG ROOT="/league_highlight"
# Herokuへデプロイする際にコメントを外す
# ENV RAILS_ENV=production
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

WORKDIR ${ROOT}

RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    curl \
    apt-transport-https \
    wget \
    cron && \
    wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends yarn && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -yqq nodejs && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}
RUN gem install bundler
RUN bundle install --jobs 4

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
