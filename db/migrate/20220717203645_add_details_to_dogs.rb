class AddDetailsToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :kaminoku, :string
    add_column :dogs, :nakanoku, :string
    add_column :dogs, :simonoku, :string
  end
end
