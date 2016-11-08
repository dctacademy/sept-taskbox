class Project < ActiveRecord::Base
=begin 
0) code of 3 party libs 
1) has many
2) belongs to 
3) validations
4) instance methods
5) custom validations
=end


	#has_many :join_table
	#has_many :associated_table, through: :join_table

	has_many :project_categories
	has_many :categories, through: :project_categories

	has_many :tasks

	belongs_to :client
	belongs_to :user



	validates :name, presence: true
	# when arguments are passed for a method we use : before, and for options for the method we pass : after, the values for the options we pass : before
	validates_length_of :description, minimum: 10
	validates_presence_of :status

	# custom validations
	# this validation will only get invoked at the time of creating a new record, and not updating
	#validate :check_status_on_create, on: :create

	validate :check_start_date


	def self.new_projects
		Project.where('status = ?', "new")
	end

	def completed_tasks
		self.tasks.where('is_completed = ?', true)
		# Task.where('is_completed = ? AND project_id = ?', true, self.id)
	end


	private 
	def check_status_on_create
		if self.status != "new"
			errors.add(:status, " is not new")
		end
	end

	def check_start_date
		if !(self.start_date.nil?)
			if self.start_date > Date.today + 7.days
				errors.add(:start_date, " is invalid")
			end
		# if !(self.start_date.nil?) && self.start_date > Date.today + 7.days
	end

	end


end
