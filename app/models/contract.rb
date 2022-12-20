class Contract < ApplicationRecord
  belongs_to :client
  has_many :batches
  attr_accessor :batches_params
  attr_accessor :batch_list

  validates_numericality_of :total_amount, :total_payments, greater_than: 0

  after_save :update_contract_in_batch

  def update_contract_in_batch
    puts "--------------------------------"
    puts batches_params.inspect
    batch_list.each do |batch|
      puts batch.id
    end
    puts "--------------------------------"
  end
end
