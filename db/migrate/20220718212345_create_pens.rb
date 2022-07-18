class CreatePens < ActiveRecord::Migration[6.1]
  def change
    create_table :pens do |t|
      t.string :simonoku_pen

      t.timestamps
    end
  end
end
