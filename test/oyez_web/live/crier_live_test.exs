defmodule OyezWeb.CrierLiveTest do
  use OyezWeb.ConnCase

  import Phoenix.LiveViewTest
  import Oyez.Pubic_placeFixtures

  @create_attrs %{hurrays_count: 42, message: "some message", name: "some name", rumors_count: 42}
  @update_attrs %{hurrays_count: 43, message: "some updated message", name: "some updated name", rumors_count: 43}
  @invalid_attrs %{hurrays_count: nil, message: nil, name: nil, rumors_count: nil}

  defp create_crier(_) do
    crier = crier_fixture()
    %{crier: crier}
  end

  describe "Index" do
    setup [:create_crier]

    test "lists all criers", %{conn: conn, crier: crier} do
      {:ok, _index_live, html} = live(conn, Routes.crier_index_path(conn, :index))

      assert html =~ "Listing Criers"
      assert html =~ crier.message
    end

    test "saves new crier", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.crier_index_path(conn, :index))

      assert index_live |> element("a", "New Crier") |> render_click() =~
               "New Crier"

      assert_patch(index_live, Routes.crier_index_path(conn, :new))

      assert index_live
             |> form("#crier-form", crier: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#crier-form", crier: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.crier_index_path(conn, :index))

      assert html =~ "Crier created successfully"
      assert html =~ "some message"
    end

    test "updates crier in listing", %{conn: conn, crier: crier} do
      {:ok, index_live, _html} = live(conn, Routes.crier_index_path(conn, :index))

      assert index_live |> element("#crier-#{crier.id} a", "Edit") |> render_click() =~
               "Edit Crier"

      assert_patch(index_live, Routes.crier_index_path(conn, :edit, crier))

      assert index_live
             |> form("#crier-form", crier: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#crier-form", crier: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.crier_index_path(conn, :index))

      assert html =~ "Crier updated successfully"
      assert html =~ "some updated message"
    end

    test "deletes crier in listing", %{conn: conn, crier: crier} do
      {:ok, index_live, _html} = live(conn, Routes.crier_index_path(conn, :index))

      assert index_live |> element("#crier-#{crier.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#crier-#{crier.id}")
    end
  end

  describe "Show" do
    setup [:create_crier]

    test "displays crier", %{conn: conn, crier: crier} do
      {:ok, _show_live, html} = live(conn, Routes.crier_show_path(conn, :show, crier))

      assert html =~ "Show Crier"
      assert html =~ crier.message
    end

    test "updates crier within modal", %{conn: conn, crier: crier} do
      {:ok, show_live, _html} = live(conn, Routes.crier_show_path(conn, :show, crier))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Crier"

      assert_patch(show_live, Routes.crier_show_path(conn, :edit, crier))

      assert show_live
             |> form("#crier-form", crier: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#crier-form", crier: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.crier_show_path(conn, :show, crier))

      assert html =~ "Crier updated successfully"
      assert html =~ "some updated message"
    end
  end
end
