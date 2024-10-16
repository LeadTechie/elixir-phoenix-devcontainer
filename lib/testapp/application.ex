defmodule Testapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TestappWeb.Telemetry,
      Testapp.Repo,
      {DNSCluster, query: Application.get_env(:testapp, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Testapp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Testapp.Finch},
      # Start a worker by calling: Testapp.Worker.start_link(arg)
      # {Testapp.Worker, arg},
      # Start to serve requests, typically the last entry
      TestappWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestappWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
