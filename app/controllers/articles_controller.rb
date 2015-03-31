class ArticlesController < ApplicationController
  def show
    @p = Article.find_by_alias params[:articlealias]
	@p[:name] = @p[:header]


  end
end
