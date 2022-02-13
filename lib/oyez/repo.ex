defmodule Oyez.Repo do
  use Ecto.Repo,
    otp_app: :oyez,
    adapter: Ecto.Adapters.Postgres
end
