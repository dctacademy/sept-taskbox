class ClientsController < ApplicationController

=begin 

GET   index - used for listing resources

GET   new - used for instantiating an object to be used in the form

POST  create - used to validate form, save the record if form is valid else dispaly an error message

GET   show - used for showing a specific resource

GET   edit - used to fetch the record to be edited from the db and display it in the form 

PATCH/PUT update - used to validate form, update the record if form is valid else dispaly an error message

delete  destroy - used to delete the record from the db 

=end 

before_action :authenticate_user!

def index
	@clients = current_user.clients #  Client.where('user_id = ?', current_user.id)
end

def new 
	@client = Client.new
end

def create
	@client = Client.new(client_params)
	@client.user_id = current_user.id  # used to attach this client to the currently logged in user 
	if @client.save # passes validation - clients_path returns "/clients"
		redirect_to clients_path, notice: "Successfully created client"
	else  # display error messages
		render action: "new"
	end
end

def show
	begin
		@client = current_user.clients.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to clients_path, notice: "Record Not Found"
	end
	#@projects = @client.projects #Project.where('client_id = ?', @client.id)
end

private 

def client_params
	params[:client].permit(:name,:mobile,:website,:company,:email)
end

end
