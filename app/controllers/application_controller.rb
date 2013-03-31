class ApplicationController < ActionController::Base
  protect_from_forgery
  # Helpers are only included in views by default, so we need to
  # explicitly include it here if we want to use some of its functions
  # in out controllers
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
