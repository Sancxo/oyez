defmodule OyezWeb.CrierLive.Show do
  use OyezWeb, :live_view

  alias Oyez.Pubic_place

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:crier, Pubic_place.get_crier!(id))}
  end

  defp page_title(:show), do: "Show Crier"
  defp page_title(:edit), do: "Edit Crier"
end
