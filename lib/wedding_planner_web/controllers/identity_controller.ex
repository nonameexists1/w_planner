defmodule WeddingPlannerWeb.IdentityController do
  use WeddingPlannerWeb, :controller

  alias WeddingPlanner.Client
  alias WeddingPlanner.Client.Identity

  def index(conn, _params) do
    client_identities = Client.list_client_identities()
    render(conn, "index.html", client_identities: client_identities)
  end

  def new(conn, _params) do
    changeset = Client.change_identity(%Identity{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"identity" => identity_params}) do
    case Client.create_identity(identity_params) do
      {:ok, identity} ->
        conn
        |> put_flash(:info, "Identity created successfully.")
        |> redirect(to: Routes.identity_path(conn, :show, identity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    identity = Client.get_identity!(id)
    render(conn, "show.html", identity: identity)
  end

  def edit(conn, %{"id" => id}) do
    identity = Client.get_identity!(id)
    changeset = Client.change_identity(identity)
    render(conn, "edit.html", identity: identity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "identity" => identity_params}) do
    identity = Client.get_identity!(id)

    case Client.update_identity(identity, identity_params) do
      {:ok, identity} ->
        conn
        |> put_flash(:info, "Identity updated successfully.")
        |> redirect(to: Routes.identity_path(conn, :show, identity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", identity: identity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    identity = Client.get_identity!(id)
    {:ok, _identity} = Client.delete_identity(identity)

    conn
    |> put_flash(:info, "Identity deleted successfully.")
    |> redirect(to: Routes.identity_path(conn, :index))
  end
end
