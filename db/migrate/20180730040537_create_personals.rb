class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.references :establishment, index: true, foreign_key: true
      t.references :architect, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
