class ChangeBorrowedPeriodDateFormatInItemTable < ActiveRecord::Migration
    def up
      change_column :items, :borrowed_period, :datetime
    end

    def down
      change_column :items, :borrowed_period, :integer
    end


end
