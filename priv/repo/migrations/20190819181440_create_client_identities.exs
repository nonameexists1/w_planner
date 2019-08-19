defmodule WeddingPlanner.Repo.Migrations.CreateClientIdentities do
  use Ecto.Migration

  def change do
    create table(:client_identities) do
      add :name, :string, null: false
      add :title, :string
      add :phone, :string
      add :address, :string
      add :webpage, :string

      timestamps()
    end

  end
end
