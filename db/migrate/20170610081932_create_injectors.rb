class CreateInjectors < ActiveRecord::Migration[5.0]
  def change
    create_table :injectors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :title
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
