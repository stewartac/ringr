class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :captain, :boolean, null: false, default: false
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
