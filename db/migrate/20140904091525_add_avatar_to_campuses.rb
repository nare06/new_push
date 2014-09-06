class AddAvatarToCampuses < ActiveRecord::Migration
  def self.up
    change_table :campuses do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :campuses, :avatar
  end
end
