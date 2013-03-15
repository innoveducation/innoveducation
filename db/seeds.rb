# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
admin_model     = RailsAdmin::AbstractModel.new(User)
admin_model.new(:email => 'adastreamer@gmail.com', :password => 'kdeyikme', :password_confirmation => 'kdeyikme', :role => 'superadmin').save
admin_model.new(:email => 'manager@startupreality.com', :password => 'kdeyikme', :password_confirmation => 'kdeyikme', :role => 'manager').save
#User.create :
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
