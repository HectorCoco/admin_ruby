class HomeController < ApplicationController
  before_action :set_catalogs

  def index
  end

  def all_notifications
    @notifications = Contract.get_notifications
    @notifications.each do |notification|
      total_paid=notification.down_payment
      notification.payments.each do |payment|
        total_paid += payment.amount
      end
    end
  end

  def set_catalogs
    @contracts = Contract.all
    @payments = Payment.all
    @batches = Batch.all
  end
end
