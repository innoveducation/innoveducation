class Newsarticle < ActiveRecord::Base
  attr_accessible :alias, :dt, :header, :position, :teaser, :text, :views, :logo
  validates :alias, :presence => true, :uniqueness => true
  has_attached_file :logo
  rails_admin do
	include_all_fields
 	field :text, :text do
  		ckeditor do
  			true
  		end
  	end
	field :views do
		default_value do
			0
		end
	end


  end
end
