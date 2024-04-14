class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    if logged_in?
      @current_user = current_user
      @article = current_user.articles.build
      @feed_items = current_user.feed.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
    end
    @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
    @user =  @article.user
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article updated"
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Article deleted"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :junre, :content, :tag)
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @article.nil?
    end
end
