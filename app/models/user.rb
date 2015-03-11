class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    # By default anyone who logs in and has items is looking to lend. That's our design constraint 
    # for now.

    # Lender
    has_many :items, foreign_key: :lender_id
    has_many :lenders, through: :items


    # We are reversing the previous lending relationship to create a situation where we can
    # the other side of the coin, i.e. if a lender lends an item then who owns it?
    # The corresponding code is a reversal of the previous. 
    
    # Borrower
    has_many :borrowed_items, foreign_key: :borrower_id, class_name: 'Item'
    has_many :borrowers, through: :borrowed_items 
end
