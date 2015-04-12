class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :set_config

  def set_config
    Tmdb::Api.key("dd3662d1e7e4774cdf161675d94d61be")
    @configuration = Tmdb::Configuration.new
  end

  def authinicate_admin!
    if !(user_signed_in? && current_user.admin)
      flash[:warning] = "Please don't do that, wonderful person!"
      redirect_to "/"
    end
  end
end
