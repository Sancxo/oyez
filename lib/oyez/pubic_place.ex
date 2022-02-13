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
    Repo.all(Crier)
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
end
