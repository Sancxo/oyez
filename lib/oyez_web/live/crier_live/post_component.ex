defmodule OyezWeb.CrierLive.PostComponent do
  use OyezWeb, :live_component

  def render(assigns) do
    ~H"""

    <div id="crier-{@crier.id}" class="crier grid grid-rows-2 border rounded border-neutral-300">
      <div class="row">
        <div class="column column-10">
          <div class="crier-avatar"></div>
        </div>

        <div class="column column-90 crier-message">
          <b>@<%= @crier.name %></b>
          <br />
          <%= @crier.message %>
        </div>
      </div>

      <div class="row">
        <div class="column">
          <i><FontAwesome.LiveView.icon name="heart" type="regular" class="h-4 w-4" /></i> <%= @crier.hurrays_count %>
        </div>
        <div class="column">
          <i><FontAwesome.LiveView.icon name="comments" type="regular" class="h-4 w-4" /></i> <%= @crier.rumors_count %>
        </div>
        <div class="column">
          <%= live_patch to: Routes.crier_index_path(@socket, :edit, @crier.id) do %>
            <i><FontAwesome.LiveView.icon name="edit" type="regular" class="h-4 w-4" /></i>
          <% end %>
          <%= link to: "#", phx_click: "delete", phx_value_id: @crier.id, data: [confirm: "Do you really want to delete this crier ?"] do %>
            <i><FontAwesome.LiveView.icon name="trash" type="solid" class="h-4 w-4" /></i>
          <% end %>
        </div>
      </div>
    </div>

    """
  end
end
