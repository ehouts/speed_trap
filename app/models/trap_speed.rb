class TrapSpeed < ActiveRecord::Base
  belongs_to :event
  belongs_to :station
  belongs_to :entrant
end
