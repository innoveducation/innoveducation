class NewsController < ApplicationController
  def show
 	@p = Newsarticle.find_by_alias params[:newsalias]
	@p[:name] = @p[:header]
	@p[:views] = @p[:views] + 1
	@p.save
 end
end
