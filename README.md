# Elixir & Phoenix with Postgres Dev Container Example Config

> Local Phoenix LiveView in 2 Minutes

This project is set up to give you the chance to run a Phoenix Project locally within 2 minutes.
You do not require any database to be pre-installed. You do not have to have Elixir or Phoenix installed locally.

The only dependencies are docker and git. 

To use, clone this repo and chose `open directory in container` in VSCode. This will give you a complete development environment with a terminal where you can run `mix` commands such as `mix phx.server`.
The container maps port 4000 to the localhost so you can access the Phoenix server from your browser.

## Prerequisites
You will need a docker runtime installed. Follow the installation instructions for your OS and make sure that you have `docker` and `docker-compose` in your `PATH`.

## Usage with other projects
To use this setup with other projects, copy the `.devcontainer` folder to the root of your project and update the `Dockerfile` to install the dependencies you need. You can also update the `docker-compose.yml` file to include any additional services you need.

## Usage with VSCode 

Clone the repository, use whatever method you prefer.
```bash
$ git clone anyalir/elixir-phoenix-devcontainer

```

Open VS Code
Install the "Dev Containers" Addon. 

```
View -> Extensions -> Dev Containers or https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
```

Click "Reopen in DevContainer" when your project loads.
Open a terminal and run the following commands:
  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Usage outside VSCode
You can also just run the devcontainer like any other docker compose project.

```bash
$ cd .devcontainer && docker-compose up
```

To access the container shell, run:

```bash
$ docker exec -it elixir-phoenix-postgres_dev_1 /bin/bash
```
In that shell, run the following commands:
  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## GitHub 
You can also use this setup with GitHub Codespaces. Just open the repository in Codespaces and you will be prompted to open the project in a devcontainer.

# Deployment

For quickly testing things out, you can use [fly.io](https://fly.io) to deploy the project. Follow the instructions on [https://fly.io/dashboard/personal/new-launch]. 
For osx:

1. Install flyctl: `brew install flyctl`
2. Run: `fly launch`


Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
