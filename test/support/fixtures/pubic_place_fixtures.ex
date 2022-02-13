defmodule Oyez.Pubic_placeFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oyez.Pubic_place` context.
  """

  @doc """
  Generate a crier.
  """
  def crier_fixture(attrs \\ %{}) do
    {:ok, crier} =
      attrs
      |> Enum.into(%{
        hurrays_count: 42,
        message: "some message",
        name: "some name",
        rumors_count: 42
      })
      |> Oyez.Pubic_place.create_crier()

    crier
  end
end
