class AddPersonalDataToUser < ActiveRecord::Migration
  def change
      change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city_name
      t.string :state_name
      t.integer :zip_code
      t.string :phone_number
      t.string :lender_rating
      t.string :borrower_rating

     end
  end
end
