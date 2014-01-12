class Contractor < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :small => "150x150", :thumb => "100x100>", :default_url => "/images/:style/missing.png" }
end
