defmodule OyezWeb.PageController do
  use OyezWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
