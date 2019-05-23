class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
   @article = Article.find(params[:id])
  end

  def new
    @article = Article.new

  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to '/articles'
    #redirect_to_article_path(@article) if @article.save
  end

  def edit
      @article = Article.find(params[:id])
  end

  def update
      @article = Article.find(params[:id])
      @article = Article.update(article_params)
      redirect_to articles_path(@article)
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to '/articles'
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
