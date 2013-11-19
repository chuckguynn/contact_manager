class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_resource
    class_name = params[:controller].singularize
    klass = class_name.camelize.constantize
    self.instance_variable_set "@" + class_name, klass.find(params[:id])
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
