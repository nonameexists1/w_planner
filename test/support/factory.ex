defmodule WeddingPlanner.Factory do
  alias WeddingPlanner.Repo

  def build(:client_identity) do
    %WeddingPlanner.Client.Identity{
      name: "Sodyba qqq",
      title: "Savo šventę praleiskite pas mus",
      phone: "860000000",
      address: "Vilnius",
      webpage: "https://google.lt"
    }
  end

  def build(:city) do
    %WeddingPlanner.Location.City{
      name: "Vilnius"
    }
  end

  def build(factory_name, attributes) do
    factory_name |> build() |> struct(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    Repo.insert! build(factory_name, attributes)
  end
end
