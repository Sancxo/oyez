defmodule OyezWeb.CrierLive.FormComponent do
  use OyezWeb, :live_component

  alias Oyez.Pubic_place

  @impl true
  def update(%{crier: crier} = assigns, socket) do
    changeset = Pubic_place.change_crier(crier)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"crier" => crier_params}, socket) do
    changeset =
      socket.assigns.crier
      |> Pubic_place.change_crier(crier_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"crier" => crier_params}, socket) do
    save_crier(socket, socket.assigns.action, crier_params)
  end

  defp save_crier(socket, :edit, crier_params) do
    case Pubic_place.update_crier(socket.assigns.crier, crier_params) do
      {:ok, _crier} ->
        {:noreply,
         socket
         |> put_flash(:info, "Crier updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_crier(socket, :new, crier_params) do
    case Pubic_place.create_crier(crier_params) do
      {:ok, _crier} ->
        {:noreply,
         socket
         |> put_flash(:info, "Crier created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
