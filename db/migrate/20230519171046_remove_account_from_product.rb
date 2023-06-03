class RemoveAccountFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :accounts_id, :integer
  end
end
