class Item < ActiveRecord::Base


belongs_to :lender
belongs_to :borrower

mount_uploader :picture, PictureUploader
end
