class Injector < ApplicationRecord
  belongs_to :provider
  has_many :reservations
end
