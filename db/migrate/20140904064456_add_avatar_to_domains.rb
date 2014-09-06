class AddAvatarToDomains < ActiveRecord::Migration
   def self.up
    change_table :domains do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :domains, :avatar
  end
end
