class Client < ApplicationRecord
  has_many :phones
  has_many :addresses
end
