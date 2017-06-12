class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.text :services
      t.datetime :date_time
      t.string :location
      t.integer :party_size
      t.references :user, foreign_key: true
      t.references :provider, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
