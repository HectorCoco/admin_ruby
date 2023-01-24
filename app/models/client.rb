class Client < ApplicationRecord
  SEARCH_COLUMNS = %w[id first_name middle_name last_name status]

  include Searchable

  has_many :phones, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :contracts

  validates :first_name, :middle_name, :last_name, presence: true

  scope :active, -> { where("status=true") }
  scope :order_by_name, -> { order(first_name: :asc) }
  scope :order_by_active, -> { order(status: :desc) }
end
