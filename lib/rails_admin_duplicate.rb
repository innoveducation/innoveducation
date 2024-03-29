require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Duplicate < RailsAdmin::Config::Actions::Base
        # There are several options that you can set here.
        # Check https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb for more info.
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            # Get all selected rows
            @objects = list_entries(@model_config, :destroy)
            # Update field published to true
            @objects.each do |object|
              #Lamp.create object.attributes
              copy = object.amoeba_dup
              copy.save
              #object.update_attribute(:published, true)
            end
            flash[:success] = "#{@model_config.label} successfully duplicated."
            redirect_to back_or_index
          end
        end
      end
    end
  end
end

