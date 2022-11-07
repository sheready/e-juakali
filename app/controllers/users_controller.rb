class UsersController < ApplicationController
  before_action :authenticate_user!, unless: :allowed_access
    

  helper_method :current_user, :signed_in?

  private

  def current_user
    # @current_user ||= User.find_by_session_token(session[:session_token])
    @current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def signed_in?
    @current_user = user
    session[:session_token] = user.reset_token!
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_token!
  end

  def sign_out
    current_user.try(:reset_token!)
    session[:session_token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end
    

  def index
    puts "hey user"
  end

  def users
    users = User.all
  end
    # private
  
    # def allowed_access
    #   current_admin
    # end
  
    # def this_user
    #   @current_user ||= session[:current_user_id] &&
    #     User.find_by(id: session[:current_user_id]) || current_admin
    # end

    
    
    # protected

   
  
  

end
