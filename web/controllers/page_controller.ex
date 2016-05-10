defmodule Slarcher.PageController do
  use Slarcher.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", var: "beef" #optional vars to access in the view
  end
end
