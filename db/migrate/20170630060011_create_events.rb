class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :hours
      t.string :description
      t.references :week, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
