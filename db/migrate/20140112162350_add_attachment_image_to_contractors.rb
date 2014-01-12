class AddAttachmentImageToContractors < ActiveRecord::Migration
  def self.up
    change_table :contractors do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :contractors, :image
  end
end
