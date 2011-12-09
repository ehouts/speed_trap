# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserLevel.create(:name => 'Admin', :user_level => 0)
UserLevel.create(:name => 'Station Operator', :user_level => 10)
UserLevel.create(:name => 'Event Coordinator', :user_level => 50)
UserLevel.create(:name => 'Guest', :user_level => 99)

User.create(:name => 'admin_ean', :email => 'ehouts@pacbell.net')
User.create(:name => 'admin_ed', :email => 'mwrench@comcast.net')

SystemSetting.create(:min_time_diff => 2, :break_time => 3 )