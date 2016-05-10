defmodule Slarcher.QuoteController do
  use Slarcher.Web, :controller
  alias Slarcher.Character
  alias Slarcher.Quote


  def create(conn, %{"character_id" => character_id, "quote" => quote_params}) do
    character = Repo.get(Character, character_id)
    { :ok, quote_record } = Ecto.build_assoc(character, :quotes)
          |> Quote.changeset(quote_params)
          |> Repo.insert
    conn
    |> redirect(to: character_path(conn, :show, character))
  end

end
