defmodule Testapp.Repo do
  use Ecto.Repo,
    otp_app: :testapp,
    adapter: Ecto.Adapters.Postgres
end
