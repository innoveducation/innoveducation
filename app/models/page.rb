class Page < ActiveRecord::Base
  attr_accessible :alias, :ancestry, :content1, :content2, :description, :hastemplate, :keywords, :name, :partialname, :showinmenu, :title, :position

	has_ancestry
	rails_admin do
#		field :position

		include_all_fields
		field :content1, :text do
			ckeditor do
				true
			end
		end
		field :content2, :text do
			ckeditor do
				true
			end
		end
		list do
			sort_by :ancestry
		end
		field :ancestry do
			default_value do
				"0"
			end
		end

		nestable_tree({
			position_field: :position,
			max_depth: 4
		})

	end
	validates :alias, :presence => true, :uniqueness => true

end
