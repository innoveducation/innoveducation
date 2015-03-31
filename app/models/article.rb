class Article < ActiveRecord::Base
  attr_accessible :header, :position, :teaser, :text, :logo, :alias
  def name
    self[:header]
  end
  has_attached_file :logo
  rails_admin do
	field :alias
	include_all_fields
  	field :text, :text do
  		ckeditor do
  			true
  		end
  	end
	nestable_list true
  end
  validates :alias, :presence => true, :uniqueness => true
end
