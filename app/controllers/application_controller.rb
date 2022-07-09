class ApplicationController < ActionController::Base
  # A current_user method that returns the first user from the database.
  def current_user
    User.first
  end
end
