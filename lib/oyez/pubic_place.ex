defmodule Oyez.Pubic_place do
  @moduledoc """
  The Pubic_place context.
  """

  import Ecto.Query, warn: false
  alias Oyez.Repo

  alias Oyez.Pubic_place.Crier

  @doc """
  Returns the list of criers.

  ## Examples

      iex> list_criers()
      [%Crier{}, ...]

  """
  def list_criers do
    Repo.all(from c in Crier, order_by: [desc: c.id])
  end

  def inc_hurrays(%Crier{id: id}) do
    {1, [crier]} =
      from(c in Crier, where: c.id == ^id, select: c)
      |> Repo.update_all(inc: [hurrays_count: 1])

    broadcast({:ok, crier}, :crier_updated)
  end

  def spread_rumors(%Crier{id: id}) do
    {1, [crier]} =
      from(c in Crier, where: c.id == ^id, select: c)
      |> Repo.update_all(inc: [rumors_count: 1])

    broadcast({:ok, crier}, :crier_updated)
  end

  @doc """
  Gets a single crier.

  Raises `Ecto.NoResultsError` if the Crier does not exist.

  ## Examples

      iex> get_crier!(123)
      %Crier{}

      iex> get_crier!(456)
      ** (Ecto.NoResultsError)

  """
  def get_crier!(id), do: Repo.get!(Crier, id)

  @doc """
  Creates a crier.

  ## Examples

      iex> create_crier(%{field: value})
      {:ok, %Crier{}}

      iex> create_crier(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_crier(attrs \\ %{}) do
    %Crier{}
    |> Crier.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:crier_created)
  end

  @doc """
  Updates a crier.

  ## Examples

      iex> update_crier(crier, %{field: new_value})
      {:ok, %Crier{}}

      iex> update_crier(crier, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_crier(%Crier{} = crier, attrs) do
    crier
    |> Crier.changeset(attrs)
    |> Repo.update()
    |> broadcast(:crier_updated)
  end

  @doc """
  Deletes a crier.

  ## Examples

      iex> delete_crier(crier)
      {:ok, %Crier{}}

      iex> delete_crier(crier)
      {:error, %Ecto.Changeset{}}

  """
  def delete_crier(%Crier{} = crier) do
    Repo.delete(crier)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking crier changes.

  ## Examples

      iex> change_crier(crier)
      %Ecto.Changeset{data: %Crier{}}

  """
  def change_crier(%Crier{} = crier, attrs \\ %{}) do
    Crier.changeset(crier, attrs)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Oyez.PubSub, "criers")
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast({:ok, crier}, event) do
    Phoenix.PubSub.broadcast(Oyez.PubSub, "criers", {event, crier})
    {:ok, crier}
  end
end
