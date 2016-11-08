class ChangeColumnTypeForBudget < ActiveRecord::Migration
  def change
  # change_column :table_name, :column_name, :new_column_type
  	change_column :projects, :budget, :float
  end
end
