class Item < ActiveRecord::Base

after_initialize :init

belongs_to :lender, class_name: 'User'
belongs_to :borrower, class_name: 'User'


def init
	self.borrower_id ||=0
end

mount_uploader :picture, PictureUploader
end
