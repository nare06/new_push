class AddContactsToGroup < ActiveRecord::Migration
  def change
      add_column :groups, :contact_name, :string
      add_column :groups, :contact_phone, :integer 
      add_column :groups, :email, :string
  end
end
