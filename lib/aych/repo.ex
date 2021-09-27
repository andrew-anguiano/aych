defmodule Aych.Repo do
  use Ecto.Repo,
    otp_app: :aych,
    adapter: Ecto.Adapters.Postgres
end
