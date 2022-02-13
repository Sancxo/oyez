defmodule Oyez.Pubic_place.Crier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "criers" do
    field :name, :string, default: "Jehan_Tabourot"
    field :message, :string
    field :hurrays_count, :integer, default: 0
    field :rumors_count, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(crier, attrs) do
    crier
    |> cast(attrs, [:message])
    |> validate_required([:message])
    |> validate_length(:message, min: 1, max: 666)
  end
end
