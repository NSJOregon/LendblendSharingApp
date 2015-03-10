class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    # Owner
    has_many :items, foreign_key: :owner_id
    has_many :owners, through: :items


    # Borrower
    has_many :borrowed_items, foreign_key: :borrower_id, class_name: 'Item'
    has_many :borrowers, through: :items 

end
