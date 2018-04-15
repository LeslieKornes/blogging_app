class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def destroy
    if @article.destroy
      flash[:success] = "Article has been deleted!"
      redirect_to articles_path
    end
  end

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created!"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article has been updated!"
      redirect_to @article
    else
      flash.now[:danger] = "Article has not been updated"
      render :edit
    end
  end

  protected
    def resource_not_found
      message = "The article you requested can't be found"
      flash[:danger] = message
      redirect_to root_path
    end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end

end
