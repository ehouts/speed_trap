class Station < ActiveRecord::Base
 belongs_to :event
 has_many :trap_speeds
 
 validates :name, :uniqueness => { :scope => [:event_id] }

end
