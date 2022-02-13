defmodule Oyez.Repo.Migrations.CreateCriers do
  use Ecto.Migration

  def change do
    create table(:criers) do
      add :name, :string
      add :message, :string
      add :hurrays_count, :integer
      add :rumors_count, :integer

      timestamps()
    end
  end
end
