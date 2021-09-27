# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Aych.Repo.insert!(%Aych.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Aych.Characters.Character

Aych.Repo.insert!(%Character{
  name: "Teste Teterson",
  age: 333,
  speed: 35,
  prof_bonus: 2,
  ac: 23,
  initiative: 2,
  hp: 20,
  max_hp: 20,
  hit_die: "d10",
  hit_dice: 2,
  max_hit_dice: 2,
  str: 13,
  dex: 15,
  prof_dex: true,
  con: 12,
  int: 10,
  wis: 8,
  cha: 18,
  prof_cha: true,
  prof_performance: true,
  cp: 25,
  sp: 19,
  gp: 150
})
