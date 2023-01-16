class Client < ApplicationRecord
  SEARCH_COLUMNS = %w[id first_name middle_name last_name status]

  include Searchable

  has_many :phones, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :contracts

  validates :first_name, :middle_name, :last_name, presence: true
end
