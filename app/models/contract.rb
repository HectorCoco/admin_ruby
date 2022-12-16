class Contract < ApplicationRecord
  belongs_to :client
  has_many :batches
end
