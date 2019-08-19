defmodule WeddingPlanner.Client.Identity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client_identities" do
    field :address, :string
    field :name, :string
    field :phone, :string
    field :title, :string
    field :webpage, :string

    timestamps()
  end

  @doc false
  def changeset(identity, attrs) do
    identity
    |> cast(attrs, [:name, :title, :phone, :address, :webpage])
    |> validate_required([:name])
  end
end
