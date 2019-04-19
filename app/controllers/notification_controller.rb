class NotificationController < ApplicationController
  def index
  def index
    @notifications = current_user.notifications
  end
  end
end
