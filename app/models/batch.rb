class Batch < ApplicationRecord
  belongs_to :contract, optional: true

  scope :allowed, -> { where("state=1") }
end
