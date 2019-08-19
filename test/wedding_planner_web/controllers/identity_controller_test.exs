defmodule WeddingPlannerWeb.IdentityControllerTest do
  use WeddingPlannerWeb.ConnCase
  import WeddingPlanner.Factory

  @create_attrs %{address: "some address", name: "some name", phone: "some phone", title: "some title", webpage: "some webpage"}
  @update_attrs %{address: "some updated address", name: "some updated name", phone: "some updated phone", title: "some updated title", webpage: "some updated webpage"}
  @invalid_attrs %{address: nil, name: nil, phone: nil, title: nil, webpage: nil}


  describe "index" do
    test "lists all client_identities", %{conn: conn} do
      conn = get(conn, Routes.identity_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Client identities"
    end
  end

  describe "new identity" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.identity_path(conn, :new))
      assert html_response(conn, 200) =~ "New Identity"
    end
  end

  describe "create identity" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.identity_path(conn, :create), identity: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.identity_path(conn, :show, id)

      conn = get(conn, Routes.identity_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Identity"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.identity_path(conn, :create), identity: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Identity"
    end
  end

  describe "edit identity" do
    setup [:create_identity]

    test "renders form for editing chosen identity", %{conn: conn, identity: identity} do
      conn = get(conn, Routes.identity_path(conn, :edit, identity))
      assert html_response(conn, 200) =~ "Edit Identity"
    end
  end

  describe "update identity" do
    setup [:create_identity]

    test "redirects when data is valid", %{conn: conn, identity: identity} do
      conn = put(conn, Routes.identity_path(conn, :update, identity), identity: @update_attrs)
      assert redirected_to(conn) == Routes.identity_path(conn, :show, identity)

      conn = get(conn, Routes.identity_path(conn, :show, identity))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, identity: identity} do
      conn = put(conn, Routes.identity_path(conn, :update, identity), identity: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Identity"
    end
  end

  describe "delete identity" do
    setup [:create_identity]

    test "deletes chosen identity", %{conn: conn, identity: identity} do
      conn = delete(conn, Routes.identity_path(conn, :delete, identity))
      assert redirected_to(conn) == Routes.identity_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.identity_path(conn, :show, identity))
      end
    end
  end

  defp create_identity(_) do
    identity = insert!(:client_identity)
    {:ok, identity: identity}
  end
end
