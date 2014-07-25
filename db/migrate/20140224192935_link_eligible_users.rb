class LinkEligibleUsers < ActiveRecord::Migration
  def change
   create_table :eligibles_users, :id => false do |t|
      t.integer :eligible_id
      t.integer :user_id
      end
   add_index(:eligibles_users, ["eligible_id", "user_id"], :unique => true)
  end
end
