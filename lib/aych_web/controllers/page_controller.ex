defmodule AychWeb.PageController do
  use AychWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
