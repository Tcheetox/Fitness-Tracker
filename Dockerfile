# ---- build stage ----
FROM ruby:3.3.0-slim AS builder

ENV RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true \
    BUNDLER_WITHOUT="development test"

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libmariadb-dev \
    nodejs \
    yarn \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs=4 --retry=3

COPY . .
RUN bundle exec rake assets:precompile

# ---- runtime stage ----
FROM ruby:3.3.0-slim

ENV RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true \
    BUNDLER_WITHOUT="development test"

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    mariadb-client \
    nodejs \
    yarn \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app /app

EXPOSE 5004

CMD ["bundle", "exec", "rails", "server", "-p", "5004"]