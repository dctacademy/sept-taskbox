# UI Framework
module Api
	module V1 
		class ClientsController < ApplicationController
			before_action :authenticate_user!
			def index 
				@clients = current_user.clients
			end

			def show
				@client = current_user.clients.find(params[:id])
			end
			
		end
	end
end