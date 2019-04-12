class ArticlesController < ApplicationController
  before_action :logged_in?, except: [:show]
  def new
  end

  def create
    @article = current_user.articles.new(header: params[:header], body: params[:body])
	  if @article.save
	    redirect_to user_path(current_user.id), notice: 'Article was successfully created.'
	  else
	    redirect_to user_path(current_user.id), notice: 'Wrong parameters.'
	  end
  end

  def destroy
    if current_user == Article.find(params[:id].to_i).user
    Article.destroy(params[:id].to_i)
	redirect_to user_path(current_user.id), notice: 'Article was successfully deleted'
	else
	  redirect_to root_url, notice: 'Log in!'
	end
  end

  def show
    @article_to_show = Article.find(params[:id].to_i)
  end
  
end
