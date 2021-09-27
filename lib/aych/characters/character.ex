defmodule Aych.Characters.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    field :age, :integer
    field :speed, :integer
    field :level, :integer, default: 1
    field :alignment, :string
    field :xp, :integer
    field :inspired, :boolean, default: false, null: false
    field :prof_bonus, :integer
    field :ac, :integer
    field :initiative, :integer
    field :hp, :integer
    field :max_hp, :integer
    field :temp_hp, :integer
    field :hit_die, :string
    field :hit_dice, :integer
    field :max_hit_dice, :integer
    field :death_save_failures, :integer, max: 3
    field :death_save_successes, :integer, max: 3
    field :personality_traits, :string
    field :ideals, :string
    field :bonds, :string
    field :flaws, :string
    field :str, :integer
    field :prof_str, :boolean, default: false, null: false
    field :dex, :integer
    field :prof_dex, :boolean, default: false, null: false
    field :con, :integer
    field :prof_con, :boolean, default: false, null: false
    field :int, :integer
    field :prof_int, :boolean, default: false, null: false
    field :wis, :integer
    field :prof_wis, :boolean, default: false, null: false
    field :cha, :integer
    field :prof_cha, :boolean, default: false, null: false
    field :prof_acrobatics, :boolean, default: false, null: false
    field :prof_animal_handling, :boolean, default: false, null: false
    field :prof_arcana, :boolean, default: false, null: false
    field :prof_ahtletics, :boolean, default: false, null: false
    field :prof_deception, :boolean, default: false, null: false
    field :prof_history, :boolean, default: false, null: false
    field :prof_insight, :boolean, default: false, null: false
    field :prof_intimidation, :boolean, default: false, null: false
    field :prof_investigation, :boolean, default: false, null: false
    field :prof_medicine, :boolean, default: false, null: false
    field :prof_nature, :boolean, default: false, null: false
    field :prof_perception, :boolean, default: false, null: false
    field :prof_performance, :boolean, default: false, null: false
    field :prof_persuasion, :boolean, default: false, null: false
    field :prof_religion, :boolean, default: false, null: false
    field :prof_sleight_of_hand, :boolean, default: false, null: false
    field :prof_stealth, :boolean, default: false, null: false
    field :prof_survival, :boolean, default: false, null: false
    field :cp, :integer
    field :sp, :integer
    field :ep, :integer
    field :gp, :integer
    field :pp, :integer
    field :spellcasting_ability, :string
    field :spell_save_dc, :integer
    field :spell_attack_bonus, :integer

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [
      :name,
      :age,
      :speed,
      :level,
      :alignment,
      :xp,
      :inspired,
      :prof_bonus,
      :ac,
      :initiative,
      :hp,
      :temp_hp,
      :max_hp,
      :hit_dice,
      :hit_die,
      :max_hit_dice,
      :death_save_failures,
      :death_save_successes,
      :personality_traits,
      :ideals,
      :bonds,
      :flaws,
      :str,
      :prof_str,
      :dex,
      :prof_dex,
      :con,
      :prof_con,
      :int,
      :prof_int,
      :wis,
      :prof_wis,
      :cha,
      :prof_cha,
      :prof_acrobatics,
      :prof_animal_handling,
      :prof_arcana,
      :prof_ahtletics,
      :prof_deception,
      :prof_history,
      :prof_insight,
      :prof_intimidation,
      :prof_investigation,
      :prof_medicine,
      :prof_nature,
      :prof_perception,
      :prof_performance,
      :prof_persuasion,
      :prof_religion,
      :prof_sleight_of_hand,
      :prof_stealth,
      :prof_survival,
      :cp,
      :sp,
      :ep,
      :gp,
      :pp,
      :spellcasting_ability,
      :spell_save_dc,
      :spell_attack_bonus
    ])
  end

  def ability_score!(character, ability) when is_atom(ability) do
    Map.fetch!(character, ability)
  end

  def ability_mod!(character, ability) when is_atom(ability) do
    ((ability_score!(character, ability) - 10) / 2) |> trunc
  end
end
