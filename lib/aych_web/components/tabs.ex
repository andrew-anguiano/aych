defmodule AychWeb.Components.Tabs do
  use Phoenix.Component

  defp active_classes(active_tab, tab) when active_tab == tab, do: "is-active"
  defp active_classes(_active_tab, _tab), do: ""

  def tabs(assigns) do
    ~H"""
    <div class="tabs">
        <ul>
        <%= for tab <- @tabs do %>
          <li class={active_classes(@active_tab, tab)}><a phx-click="tab" phx-value-tab={tab}><%= tab %></a></li>
        <% end %>
        </ul>
    </div>
    """
  end
end
