class AddTitleToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :family_name, :string
  end
end
