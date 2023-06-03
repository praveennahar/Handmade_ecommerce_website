class AddNameToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :firstname, :string
    add_column :accounts, :lastname, :string
    add_column :accounts, :gender, :string
    add_column :accounts, :age, :integer
    add_column :accounts, :phone, :integer
    add_column :accounts, :address, :string
  end
end
