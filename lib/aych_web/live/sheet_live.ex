defmodule AychWeb.SheetLive do
  use Phoenix.LiveView

  import AychWeb.Components.{AbilityScoresComponent, Tabs}

  alias Aych.Characters

  @tabs ~w(Favorites Spells Inventory Features)
  @default_tab "Favorites"

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    try do
      character = Characters.get_character!(id)
      {:ok, socket |> assign(character: character, tabs: @tabs, active_tab: @default_tab)}
    rescue
      Ecto.NoResultsError -> {:ok, redirect(socket, to: "/")}
    end
  end

  @impl true
  def handle_event("roll", params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("tab", %{"tab" => tab}, socket) do
    {:noreply, socket |> assign(active_tab: tab)}
  end
end
