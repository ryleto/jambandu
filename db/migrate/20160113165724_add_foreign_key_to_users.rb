class AddForeignKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_id, :integer
    add_reference :users, :companies, index: true, foreign_key: true
    #add_foreign_key :users, :companies
  end
end
