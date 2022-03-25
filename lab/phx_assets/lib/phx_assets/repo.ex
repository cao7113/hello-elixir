defmodule PhxAssets.Repo do
  use Ecto.Repo,
    otp_app: :phx_assets,
    adapter: Ecto.Adapters.Postgres
end
