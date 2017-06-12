class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  serialize :services, Array
end
