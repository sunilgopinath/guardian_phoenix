defmodule GuardianPhoenix.ArticleController do
  use GuardianPhoenix.Web, :controller

  alias GuardianPhoenix.Article
  plug Guardian.Plug.EnsureAuthenticated, [handler: GuardianPhoenix.GuardianErrorHandler]  when action in [:create]
  plug :scrub_params, "article" when action in [:create, :update]

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.json", articles: articles)
  end

  # def new(conn, _params) do
  #   changeset = Article.changeset(%Article{})
  #   render(conn, "new.html", changeset: changeset)
  # end
  #
  def create(conn, %{"article" => article_params}) do
    changeset = Article.changeset(%Article{}, article_params)

    case Repo.insert(changeset) do
      {:ok, article} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", article_path(conn, :show, article))
        |> render("show.json", article: article)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(GuardianPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)
    render(conn, "show.json", article: article)
  end
  #
  # def edit(conn, %{"id" => id}) do
  #   article = Repo.get!(Article, id)
  #   changeset = Article.changeset(article)
  #   render(conn, "edit.html", article: article, changeset: changeset)
  # end
  #
  # def update(conn, %{"id" => id, "article" => article_params}) do
  #   article = Repo.get!(Article, id)
  #   changeset = Article.changeset(article, article_params)
  #
  #   case Repo.update(changeset) do
  #     {:ok, article} ->
  #       conn
  #       |> put_flash(:info, "Article updated successfully.")
  #       |> redirect(to: article_path(conn, :show, article))
  #     {:error, changeset} ->
  #       render(conn, "edit.html", article: article, changeset: changeset)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   article = Repo.get!(Article, id)
  #
  #   # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
  #   Repo.delete!(article)
  #
  #   conn
  #   |> put_flash(:info, "Article deleted successfully.")
  #   |> redirect(to: article_path(conn, :index))
  # end
end
