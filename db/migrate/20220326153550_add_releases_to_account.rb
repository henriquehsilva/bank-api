class AddReleasesToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :releases, :string, array: true, default: []
  end
end
