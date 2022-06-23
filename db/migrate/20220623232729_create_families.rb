class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :family_name
      t.string :image
      t.text :family_pr

      t.timestamps
    end
  end
end
