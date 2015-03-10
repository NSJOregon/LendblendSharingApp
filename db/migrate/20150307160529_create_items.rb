class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :borrow_period
      t.integer :borrowed_period
      t.integer :owner_id
      t.integer :borrower_id

      t.timestamps null: false
    end
  end
end
