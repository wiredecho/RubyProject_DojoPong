class Game < ActiveRecord::Base
  belongs_to :winner_id, :class_name => 'User'
  belongs_to :loser_id, :class_name => 'User'
end
