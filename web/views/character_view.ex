defmodule Slarcher.CharacterView do
  use Slarcher.Web, :view

  def make_loud(var) do
    String.upcase var
  end

  # def render("index.html", _assigns) do
  #   "All your beef are belong to us"
  # end
end
