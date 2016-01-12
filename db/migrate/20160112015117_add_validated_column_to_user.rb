class AddValidatedColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :validated, :boolean, default: 0, null: false
  end
end
