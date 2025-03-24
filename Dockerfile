# ---- Build Stage ----
  FROM elixir:1.17-alpine AS build

  # Install build tools, Node.js, npm, and git for assets compilation
  RUN apk add --no-cache build-base git nodejs npm python3 curl
  
  # Set working directory
  WORKDIR /app
  
  # Set production environment
  ENV MIX_ENV=prod
  
  # Install Hex and Rebar
  RUN mix local.hex --force && \
      mix local.rebar --force
  
  # Cache Elixir dependencies
  COPY mix.exs mix.lock ./
  RUN mix deps.get --only prod
  RUN mix deps.compile
  
  # Cache npm dependencies
  COPY assets/package.json assets/package-lock.json ./assets/
  RUN npm --prefix assets ci --progress=false --no-audit --loglevel=error
  
  # Copy rest of the application code
  COPY . .
  
  # Compile assets
  RUN npm run --prefix assets deploy
  
  # Digest static assets for Phoenix
  RUN mix phx.digest
  
  # Compile application
  RUN mix compile
  
  # Generate production release
  RUN mix release
  
  # ---- Runtime Stage ----
  FROM alpine:3.19 AS app
  
  # Install runtime dependencies only
  RUN apk add --no-cache libstdc++ openssl ncurses-libs
  
  WORKDIR /app
  
  # Copy release from build stage
  COPY --from=build /app/_build/prod/rel/testapp ./
  
  # Expose application port required by Fly.io
  EXPOSE 8080
  
  # Start the Phoenix server
  CMD ["/app/bin/server"]
  