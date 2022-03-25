defmodule PhxAssetsWeb.PageController do
  use PhxAssetsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
