class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_notifications

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path + "users/sign_in"
  end

  def set_notifications
    @notifications = Contract.get_notifications.limit(5)
  end
end
