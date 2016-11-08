class CreateContactManagers < ActiveRecord::Migration
  def change
    create_table :contact_managers do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :city

      t.timestamps null: false
    end
  end
end
