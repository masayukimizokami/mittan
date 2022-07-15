class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :onaka
      t.integer :kigen
      t.string :image
      t.string :pr
      t.integer :yobip

      t.timestamps
    end
  end
end
