class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.find_by_id(session[:user_id])
    if @article.save
      flash[:success] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params) && @article.user_id == session[:user_id]
      flash[:success] = "Article was successfully updated!"
      redirect_to article_path(@article)
    elsif @article.user_id != session[:user_id] && @article.errors.empty?
      flash[:danger] = "You must be the article owner to make an edit!"
      render 'edit'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if @article.user_id == session[:user_id]
      @article.destroy
      flash[:danger] = "Article was successfully deleted."
      redirect_to articles_path
    else
      flash[:danger] = "You must be the article owner to delete it!"
      render 'show'
    end 
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end

end
