class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :role, :position
  # attr_accessible :title, :body

  

  rails_admin do
    include_all_fields
    weight -1
    field :email do
      help { model = self.abstract_model.model_name.underscore; field = self.name; model_lookup = "admin.help.#{model}.#{field}".to_sym; field_lookup = "admin.help.#{field}".to_sym; I18n.t model_lookup, :help => help, :default => [field_lookup, help] }
    end
    nestable_list true
  end
end
