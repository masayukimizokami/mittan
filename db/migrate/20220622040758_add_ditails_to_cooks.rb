class AddDitailsToCooks < ActiveRecord::Migration[6.1]
  def change
    add_column :cooks, :date, :datetime
  end
end
