defmodule Oyez.Pubic_placeTest do
  use Oyez.DataCase

  alias Oyez.Pubic_place

  describe "criers" do
    alias Oyez.Pubic_place.Crier

    import Oyez.Pubic_placeFixtures

    @invalid_attrs %{hurrays_count: nil, message: nil, name: nil, rumors_count: nil}

    test "list_criers/0 returns all criers" do
      crier = crier_fixture()
      assert Pubic_place.list_criers() == [crier]
    end

    test "get_crier!/1 returns the crier with given id" do
      crier = crier_fixture()
      assert Pubic_place.get_crier!(crier.id) == crier
    end

    test "create_crier/1 with valid data creates a crier" do
      valid_attrs = %{hurrays_count: 42, message: "some message", name: "some name", rumors_count: 42}

      assert {:ok, %Crier{} = crier} = Pubic_place.create_crier(valid_attrs)
      assert crier.hurrays_count == 42
      assert crier.message == "some message"
      assert crier.name == "some name"
      assert crier.rumors_count == 42
    end

    test "create_crier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pubic_place.create_crier(@invalid_attrs)
    end

    test "update_crier/2 with valid data updates the crier" do
      crier = crier_fixture()
      update_attrs = %{hurrays_count: 43, message: "some updated message", name: "some updated name", rumors_count: 43}

      assert {:ok, %Crier{} = crier} = Pubic_place.update_crier(crier, update_attrs)
      assert crier.hurrays_count == 43
      assert crier.message == "some updated message"
      assert crier.name == "some updated name"
      assert crier.rumors_count == 43
    end

    test "update_crier/2 with invalid data returns error changeset" do
      crier = crier_fixture()
      assert {:error, %Ecto.Changeset{}} = Pubic_place.update_crier(crier, @invalid_attrs)
      assert crier == Pubic_place.get_crier!(crier.id)
    end

    test "delete_crier/1 deletes the crier" do
      crier = crier_fixture()
      assert {:ok, %Crier{}} = Pubic_place.delete_crier(crier)
      assert_raise Ecto.NoResultsError, fn -> Pubic_place.get_crier!(crier.id) end
    end

    test "change_crier/1 returns a crier changeset" do
      crier = crier_fixture()
      assert %Ecto.Changeset{} = Pubic_place.change_crier(crier)
    end
  end
end
