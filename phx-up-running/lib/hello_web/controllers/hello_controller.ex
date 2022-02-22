defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messager" => messager} = _params) do
    render(conn, "show.html", messager: messager)
  end
end
