class AddBudgetToProjects < ActiveRecord::Migration
  def change
  	#add_column :table_name, :new_column_name, :column_type
  	add_column :projects, :budget, :string
  	add_column :clients, :city, :string
  end
end
