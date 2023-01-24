class HomeController < ApplicationController
  before_action :set_catalogs

  def index
  end

  def all_notifications
    @notifications = Contract.get_notifications
  end

  def set_catalogs
    @contracts = Contract.all
    @payments = Payment.all
  end
end
