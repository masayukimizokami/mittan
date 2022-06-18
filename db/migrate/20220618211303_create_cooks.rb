class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
      t.string :cookname
      t.string :cookurl
      t.string :image
      t.text :pr
      t.string :cost
      t.string :recom
      t.date :cookingday
      t.integer :point
      t.string :standby

      t.timestamps
    end
  end
end
