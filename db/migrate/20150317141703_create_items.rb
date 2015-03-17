class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :borrow_period
      t.integer :borrowed_period
      t.integer :lender_id, :index =>true
      t.integer :borrower_id, :index =>true

      t.timestamps null: false
    end
  end
end
