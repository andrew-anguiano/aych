defmodule AychWeb.Components.AbilityScoresComponent do
  alias Aych.Characters.Character
  use Phoenix.Component

  @abilities [
    {:str, "Strength"},
    {:dex, "Dexterity"},
    {:con, "Constitution"},
    {:int, "Intelligence"},
    {:wis, "Wisdom"},
    {:cha, "Charisma"}
  ]

  def ability_scores(assigns) do
    assigns = assign(assigns, abilities: @abilities)

    ~H"""
    <div class="level">
      <%= for {atom, name} <- @abilities do %>
      <% score = Character.ability_score!(@character, atom) %>

        <div class="level-item has-text-centered">
          <div>
            <p class="heading" title={name}><%= atom |> Atom.to_string |> String.capitalize() %></p>
            <p class="title" phx-click="roll" phx-value-attr={atom} phx-value-val={score}><%= score %></p>
            <small><%= Character.ability_mod!(@character, atom) %></small>
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
