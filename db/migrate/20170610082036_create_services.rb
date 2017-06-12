class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.integer :cost
      t.string :name
      t.string :description
      t.string :disclaimer
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
