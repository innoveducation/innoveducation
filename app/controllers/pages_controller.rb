class PagesController < ApplicationController

  def show
    @rootpage = Page.find :first
	@pa = params[:pagealias]
	@pa = @rootpage.alias if @pa.nil?
    
	@p = Page.find_by_alias @pa

	@pages = Page.find :all, :order => 'position'


	an = @p[:ancestry].split("/")
	if an.size.eql? 2 then
		@pp = Page.find :all, :order => 'position', :conditions => { :ancestry => @p[:ancestry] }
		@parentpage = Page.find_by_id an[1]
	end
	

  end
  
  def mail
	UserMailer.welcome_email(params[:name], params[:email], params[:message]).deliver
	render :layout => "mail"
  end
  
  def subscribe
	Subscriber.create :email => params[:email]
	
	render :layout => "subscribe"
  end
  
  
end
