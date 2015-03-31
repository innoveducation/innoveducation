class Sitesetting < ActiveRecord::Base
  attr_accessible :address, :copyright, :description, :email, :footerleft, :keywords, :phones, :skype, :title
end
