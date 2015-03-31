class Partner < ActiveRecord::Base
  attr_accessible :name, :openinnewtab, :url, :logo
  rails_admin do
    nestable_list true
  end
  has_attached_file :logo
end
