defmodule Slarcher.PageController do
  use Slarcher.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end