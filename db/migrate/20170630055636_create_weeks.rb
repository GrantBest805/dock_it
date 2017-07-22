class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.integer :number
      t.string :week_of
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
