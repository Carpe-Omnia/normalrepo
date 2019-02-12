class User < ApplicationRecord
	has_secure_password 
	
	has_many :jokes, :foreign_key => 'author_id' 
end
