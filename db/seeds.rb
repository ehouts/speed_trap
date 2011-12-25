# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#UserType.create(:name => 'Admin', :user_level => 0)
#UserType.create(:name => 'Station Operator', :user_level => 10)
#UserType.create(:name => 'Event Coordinator', :user_level => 50)
#UserType.create(:name => 'Guest', :user_level => 99)
#
#User.create(:name => 'admin_ean', :email => 'ehouts@pacbell.net',
#            :user_type_id => UserType.find(:first, :conditions => "user_level = 0").id )
#User.create(:name => 'admin_ed', :email => 'mwrench@comcast.net',
#            :user_type_id => UserType.find(:first, :conditions => "user_level = 0").id )

User.create! :username => "admin_ean", :email => 'ehouts@pacbell.net', :password => 'tos1byte', :password_confirmation => 'tos1byte', :user_level => 0
User.create! :username => "admin_ed", :email => 'mwrench@comcast.net', :password => 'mchevy', :password_confirmation => 'mchevy', :user_level => 0
User.create! :username => "guest", :email => 'scoobysnack0@gmail.com', :password => 'faster', :password_confirmation => 'faster', :user_level => 99

SystemSetting.create(:min_time_diff => 2, :break_time => 3 )