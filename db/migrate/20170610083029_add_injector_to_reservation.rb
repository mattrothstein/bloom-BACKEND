class AddInjectorToReservation < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :injector, foreign_key: true
  end
end
