defmodule Aych.Rules do
  require Logger

  @extraneous_keys ~w(_meta linkedLootTables)
  @special_folders ~w(spells classes)a
  @ets_opts ~w(named_table protected set)a

  def load_rules_into_ets() do
    get_json_in_rules_path()
    # This is disgusting but it's late
    # TODO: refactor
    |> Enum.reject(fn file ->
      String.split(file, "/") |> Enum.any?(&(&1 in special_folders_as_strings()))
    end)
    |> Enum.each(fn file ->
      table_name =
        file
        |> Path.basename(".json")
        |> filename_to_ets

      {table_name, file} |> load_file_into_ets
    end)

    Enum.each(@special_folders, &load_folder_into_ets/1)
  end

  def load_folder_into_ets(folder_name) when is_atom(folder_name) do
    Logger.info("Loading folder into ETS: #{Atom.to_string(folder_name)}")
    :ets.new(folder_name, @ets_opts)

    get_json_in_rules_path(folder_name |> Atom.to_string())
    |> Enum.reduce(%{}, fn file, acc ->
      Map.merge(acc, parse_file(file))
    end)
    |> Enum.each(&:ets.insert_new(folder_name, &1))
  end

  defp get_json_in_rules_path() do
    "#{:code.priv_dir(:aych)}/rules/5e/**/*.json"
    |> Path.wildcard()
  end

  defp get_json_in_rules_path(path) do
    "#{:code.priv_dir(:aych)}/rules/5e/#{path}/*.json"
    |> Path.wildcard()
  end

  defp load_file_into_ets({table_name, file}) do
    Logger.info("Loading ETS data for: 5e/#{table_name}")
    :ets.new(table_name, @ets_opts)

    file |> parse_file |> Enum.each(&:ets.insert_new(table_name, &1))
  end

  defp filename_to_ets(name) when is_binary(name) do
    name |> String.downcase() |> String.replace("-", "_") |> String.to_atom()
  end

  defp parse_file(file) do
    file
    |> File.read!()
    |> Jason.decode!()
    |> strip_extraneous()
    |> Enum.reduce(%{}, &coerce_to_kv/2)
  end

  defp strip_extraneous(json_data) do
    {_type, entries} = json_data |> Map.drop(@extraneous_keys) |> Enum.at(0)
    entries
  end

  defp coerce_to_kv(value, acc) do
    key = :erlang.phash2(value)
    acc |> Map.put(key, value)
  end

  defp special_folders_as_strings do
    Enum.map(@special_folders, &Atom.to_string/1)
  end
end
