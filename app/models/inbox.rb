class Inbox < ApplicationRecord 
	has_many :messages, :foreign_key => 'to_id'
	belongs_to :user 
end 
