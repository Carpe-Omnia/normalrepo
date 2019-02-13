class Message < ApplicationRecord 
	belongs_to :sender, :class_name => 'User', :foreign_key => 'from_id'
	has_one :inbox 
end 
