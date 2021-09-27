defmodule Aych.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :age, :integer
      add :speed, :integer
      add :level, :integer, default: 1
      add :alignment, :string
      add :xp, :integer
      add :inspired, :boolean, default: false, null: false
      add :prof_bonus, :integer
      add :ac, :integer
      add :initiative, :integer
      add :hp, :integer
      add :max_hp, :integer
      add :temp_hp, :integer
      add :hit_die, :string
      add :hit_dice, :integer
      add :max_hit_dice, :integer
      add :death_save_failures, :integer, max: 3
      add :death_save_successes, :integer, max: 3
      add :personality_traits, :text
      add :ideals, :text
      add :bonds, :text
      add :flaws, :text
      add :str, :integer
      add :prof_str, :boolean, default: false, null: false
      add :dex, :integer
      add :prof_dex, :boolean, default: false, null: false
      add :con, :integer
      add :prof_con, :boolean, default: false, null: false
      add :int, :integer
      add :prof_int, :boolean, default: false, null: false
      add :wis, :integer
      add :prof_wis, :boolean, default: false, null: false
      add :cha, :integer
      add :prof_cha, :boolean, default: false, null: false
      add :prof_acrobatics, :boolean, default: false, null: false
      add :prof_animal_handling, :boolean, default: false, null: false
      add :prof_arcana, :boolean, default: false, null: false
      add :prof_ahtletics, :boolean, default: false, null: false
      add :prof_deception, :boolean, default: false, null: false
      add :prof_history, :boolean, default: false, null: false
      add :prof_insight, :boolean, default: false, null: false
      add :prof_intimidation, :boolean, default: false, null: false
      add :prof_investigation, :boolean, default: false, null: false
      add :prof_medicine, :boolean, default: false, null: false
      add :prof_nature, :boolean, default: false, null: false
      add :prof_perception, :boolean, default: false, null: false
      add :prof_performance, :boolean, default: false, null: false
      add :prof_persuasion, :boolean, default: false, null: false
      add :prof_religion, :boolean, default: false, null: false
      add :prof_sleight_of_hand, :boolean, default: false, null: false
      add :prof_stealth, :boolean, default: false, null: false
      add :prof_survival, :boolean, default: false, null: false
      add :cp, :integer
      add :sp, :integer
      add :ep, :integer
      add :gp, :integer
      add :pp, :integer
      add :spellcasting_ability, :text
      add :spell_save_dc, :integer
      add :spell_attack_bonus, :integer

      timestamps()
    end
  end
end
