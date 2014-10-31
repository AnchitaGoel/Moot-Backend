class User < ActiveRecord::Base

	#validates :username , presence: true, uniqueness: true
	#validates :gcm_id , presence: true, uniqueness: true
	validates_format_of :emailId, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
