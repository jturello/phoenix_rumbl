defmodule Rumbl.Repo do
  #  use Ecto.Repo, otp_app: :rumbl

  @moduledoc """
  In memory repository
  """

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Fred Flintstone", username: "fstone", password: "elixir"},
     %Rumbl.User{id: "2", name: "Wilma Flintstone", username: "wstone", password: "phoenix"},
     %Rumbl.User{id: "3", name: "Barney Rubble", username: "brubble", password: "lang"},
     %Rumbl.User{id: "4", name: "Bambam Flintstone", username: "bbstone", password: "bam"}]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do 
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
