defmodule Slarcher.CharacterController do
  use Slarcher.Web, :controller
  alias Slarcher.Character
  alias Slarcher.Quote
  require IEx

  def index(conn, _params) do
    characters = Repo.all(Character)

    render conn, "index.html", characters: characters
  end

  def show(conn, %{"id" => id}) do
    character = Repo.get(Character, id) |> Repo.preload(:quotes)
    quote_cs = Quote.changeset(%Quote{})

    render conn, "show.html", character: character, quote_cs: quote_cs
  end

  def new(conn, _params) do
    changeset = Character.changeset(%Character{})
    render conn, "new.html", changeset: changeset
  end

        #maps to the function in the model
  def create(conn, %{"character" => character}) do
    # IEx.pry
    changeset = Character.changeset(%Character{}, character)
    {:ok, character} = Repo.insert(changeset)

    conn
    |> put_flash(:info, "Character Created!")
    |> redirect(to: character_path(conn, :show, character))

    # case Repo.inset(changeset) do
    #   {:ok, character} ->
    #     :render...
    #   {:error, changeset} ->
    #     :rerender
    # end
  end

end
