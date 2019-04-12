class PageController < ApplicationController
  def index
  end

  def search
    !!@user = User.find_by(login: params[:search_query])
  end
end
