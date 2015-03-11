class Item < ActiveRecord::Base

belongs_to :borrower
belongs_to :lender

mount_uploader :picture, PictureUploader
end
