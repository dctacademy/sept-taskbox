class Client < ActiveRecord::Base
	belongs_to :user
	has_many :projects
	
	validates_presence_of :name, :email, :mobile
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :email



	def details
		"#{name} - #{company}"
	end
end
