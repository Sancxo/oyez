defmodule OyezWeb.CrierLive.CrierComponent do
  use OyezWeb, :live_component

  alias Oyez.Pubic_place

  # def render(assigns) do
  #   ~H"""

  #   """
  # end

  def handle_event("hurray", _payload, socket) do
    Pubic_place.inc_hurrays(socket.assigns.crier)
    {:noreply, socket}
  end

  def handle_event("rumor", _payload, socket) do
    Pubic_place.spread_rumors(socket.assigns.crier)
    {:noreply, socket}
  end
end
