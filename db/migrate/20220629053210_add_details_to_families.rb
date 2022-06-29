class AddDetailsToFamilies < ActiveRecord::Migration[6.1]
  def change
    add_column :families, :point, :int
  end
end
