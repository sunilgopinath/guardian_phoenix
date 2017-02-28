defmodule GuardianPhoenix.ArticleView do
  use GuardianPhoenix.Web, :view

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, GuardianPhoenix.ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, GuardianPhoenix.ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{
      id: article.id,
      title: article.title,
      url: article.url,
      categories: article.categories
    }
  end
end
