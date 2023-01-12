class Client < ApplicationRecord
  SEARCH_COLUMNS = %w[id first_name middle_name last_name status]

  include Searchable

  has_many :phones
  has_many :addresses
  has_many :contracts

  validates :first_name, :middle_name, :last_name, presence: true
end
