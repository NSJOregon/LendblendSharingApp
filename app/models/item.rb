class Item < ActiveRecord::Base

belongs_to :lender, class_name: 'User'
belongs_to :borrower, class_name: 'User'

mount_uploader :picture, PictureUploader
end
