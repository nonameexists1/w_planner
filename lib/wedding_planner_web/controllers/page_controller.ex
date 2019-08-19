defmodule WeddingPlannerWeb.PageController do
  use WeddingPlannerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
