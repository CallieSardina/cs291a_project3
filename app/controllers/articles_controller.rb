class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  #def new
  #  @article = Article.new
  #end

  def create
    @user = User.find(params[:user_id])
    #@article = @user.articles.create(article_params)
    @article = Article.new(article_params)
    redirect_to user_path(@user)
    # @article = Article.new(article_params)

    #if @article.save
    #  redirect_to user_path(@user)
    #else
    #  redirect_to user_path(@user)
    #  #render :index, status: :unprocessable_entity
    #end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @article = @user.article.find(params[:id])
    # @article = Article.find(params[:id])
    @article.destroy

    redirect_to user_path(@user), status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
