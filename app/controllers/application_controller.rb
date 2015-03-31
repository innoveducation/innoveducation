class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :ss
  def ss
    Sitesetting.find :first 
  end


  helper_method :topPages
  def topPages
	pagesContainer = (Page.find_by_alias 'top').id
    Page.find :all, :order => 'position', :conditions => { :ancestry => pagesContainer } 
  end

  helper_method :centerPages
  def centerPages
	pagesContainer = (Page.find_by_alias 'center').id
    Page.find :all, :order => 'position', :conditions => { :ancestry => pagesContainer } 
  end

  helper_method :getPages
  def getPages p
  	a = (Page.find_by_id p).ancestry
    Page.find :all, :order => 'position', :conditions => { :ancestry => "#{a}/#{p}" }
  end

  helper_method :partners
  def partners
    Partner.find :all, :order => 'position'
  end

  helper_method :articles
  def articles
    Article.find :all, :order => 'position'
  end


  helper_method :news3
  def news3
    Newsarticle.find :all, :order => 'position', :limit => 3
  end


end
