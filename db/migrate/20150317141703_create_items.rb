class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :borrow_period
      t.integer :borrowed_period
      t.string :lender, :index =>true
      t.string :borrower, :index =>true

      t.timestamps null: false
    end
  end
end
