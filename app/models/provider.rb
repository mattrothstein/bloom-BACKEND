class Provider < ApplicationRecord
  has_many :injectors
  has_many :services
end
