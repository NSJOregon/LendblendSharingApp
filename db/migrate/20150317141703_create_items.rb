class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :borrow_period
      t.integer :borrowed_period
      t.references :lender, :index =>true
      t.references :borrower, :index =>true

      t.timestamps null: false
    end
  end
end
