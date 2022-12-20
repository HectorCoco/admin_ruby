class Client < ApplicationRecord
  has_many :phones
  has_many :addresses

  validates :first_name, :middle_name, :last_name, presence: true
end
