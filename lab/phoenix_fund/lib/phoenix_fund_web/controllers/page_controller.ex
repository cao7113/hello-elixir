defmodule PhoenixFundWeb.PageController do
  use PhoenixFundWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
