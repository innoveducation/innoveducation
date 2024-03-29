# RailsAdmin config file. Generated on March 13, 2013 18:49
# See github.com/sferik/rails_admin for more informations
 
require 'i18n'
require Rails.root.join('lib', 'rails_admin_duplicate.rb')

RailsAdmin.config do |config|

  config.authorize_with :cancan
  ################  Global configuration  ################
  I18n.default_locale = :ru
  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Admin Panel v1.0', 'обр.связь : 8-(905)-122-22-66']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]

  #log = Logger.new(STDOUT)
  #log.level = Logger::WARN
 
  config.current_user_method {
#    config.included_models = ["User"]# if current_user[:email] == "adastreamer@gmail.com"
#    log.warn(current_user[:email])
    current_user
  } # auto-generated


#  config.included_models = ["User"]
 
#  log.warn(current_user)

#  if (ENV['ADMIN_MODE'] == 'admin')
#   config.included_models = ["User"]
#  end



  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = []

  # Include specific models (exclude the others):
  # config.included_models = []

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:

# Register the class in lib/rails_admin_publish.rb
module RailsAdmin
  module Config
    module Actions
      class Duplicate < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
      end
    end
  end
end



  config.actions do
    # root actions
    dashboard                     # mandatory

    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app



    # Add the nestable action for each model
    nestable do
      visible do
        bindings[:abstract_model].model
      end
    end


    # Set the custom action here
    duplicate do
      # Make it visible only for article model. You can remove this if you don't need.
      visible do
        bindings[:abstract_model].model
      end
    end
  end

end

