class CreateDogruns < ActiveRecord::Migration[6.1]
  def change
    create_table :dogruns do |t|
      t.string :dogrun_name

      t.timestamps
    end
  end
end
