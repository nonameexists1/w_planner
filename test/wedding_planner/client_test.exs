defmodule WeddingPlanner.ClientTest do
  use WeddingPlanner.DataCase

  alias WeddingPlanner.Client
  import WeddingPlanner.Factory

  describe "client_identities" do
    alias WeddingPlanner.Client.Identity

    @valid_attrs %{address: "some address", name: "some name", phone: "some phone", title: "some title", webpage: "some webpage"}
    @update_attrs %{address: "some updated address", name: "some updated name", phone: "some updated phone", title: "some updated title", webpage: "some updated webpage"}
    @invalid_attrs %{address: nil, name: nil, phone: nil, title: nil, webpage: nil}


    test "list_client_identities/0 returns all client_identities" do
      identity = insert!(:client_identity)
      assert Client.list_client_identities() == [identity]
    end

    test "get_identity!/1 returns the identity with given id" do
      identity = insert!(:client_identity)
      assert Client.get_identity!(identity.id) == identity
    end

    test "create_identity/1 with valid data creates a identity" do
      assert {:ok, %Identity{} = identity} = Client.create_identity(@valid_attrs)
      assert identity.address == "some address"
      assert identity.name == "some name"
      assert identity.phone == "some phone"
      assert identity.title == "some title"
      assert identity.webpage == "some webpage"
    end

    test "create_identity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Client.create_identity(@invalid_attrs)
    end

    test "update_identity/2 with valid data updates the identity" do
      identity = insert!(:client_identity)
      assert {:ok, %Identity{} = identity} = Client.update_identity(identity, @update_attrs)
      assert identity.address == "some updated address"
      assert identity.name == "some updated name"
      assert identity.phone == "some updated phone"
      assert identity.title == "some updated title"
      assert identity.webpage == "some updated webpage"
    end

    test "update_identity/2 with invalid data returns error changeset" do
      identity = insert!(:client_identity)
      assert {:error, %Ecto.Changeset{}} = Client.update_identity(identity, @invalid_attrs)
      assert identity == Client.get_identity!(identity.id)
    end

    test "delete_identity/1 deletes the identity" do
      identity = insert!(:client_identity)
      assert {:ok, %Identity{}} = Client.delete_identity(identity)
      assert_raise Ecto.NoResultsError, fn -> Client.get_identity!(identity.id) end
    end

    test "change_identity/1 returns a identity changeset" do
      identity = insert!(:client_identity)
      assert %Ecto.Changeset{} = Client.change_identity(identity)
    end
  end
end
