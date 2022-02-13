defmodule OyezWeb.CrierLive.Index do
  use OyezWeb, :live_view

  alias Oyez.Pubic_place
  alias Oyez.Pubic_place.Crier

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :criers, list_criers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Crier")
    |> assign(:crier, Pubic_place.get_crier!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Crier")
    |> assign(:crier, %Crier{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Criers")
    |> assign(:crier, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    crier = Pubic_place.get_crier!(id)
    {:ok, _} = Pubic_place.delete_crier(crier)

    {:noreply, assign(socket, :criers, list_criers())}
  end

  defp list_criers do
    Pubic_place.list_criers()
  end
end
