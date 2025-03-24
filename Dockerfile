FROM elixir:1.17-alpine AS build

# Install necessary build tools, Node.js, npm, Git, and curl
RUN apk add --no-cache build-base git nodejs npm curl python3

ENV MIX_ENV=prod
WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

# Install Elixir deps
COPY mix.exs mix.lock ./
RUN mix deps.get --only prod && mix deps.compile

# Set up assets
COPY assets/package.json assets/package-lock.json ./assets/
RUN npm --prefix assets ci

# Copy project source code
COPY . .

# Build JS and Tailwind CSS assets for production
RUN npm run --prefix assets deploy
RUN mix assets.deploy

# Generate Phoenix digest of static assets
RUN mix phx.digest

# Compile Elixir application
RUN mix compile

# Create Phoenix production release
RUN mix release

# Runtime image
FROM alpine:3.19 AS app
RUN apk add --no-cache libstdc++ openssl ncurses-libs
WORKDIR /app
COPY --from=build /app/_build/prod/rel/testapp ./

EXPOSE 8080
CMD ["/app/bin/server"]
