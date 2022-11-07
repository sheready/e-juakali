# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # include Accessible
  # skip_before_action :check_user, only: :destroy
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # # POST /resource/sign_in
  def create
    @user = User.find_by_email(user_params[:email])
    if @user && @user.valid_password?(user_params[:password])
      sign_in :user, @user
      render json: @user
      session[:current_user_id] = @user.id
    elsif @user && not(@user.valid_password?(user_params[:password]))
      invalid_attempt
    else
      no_user
    end
  end

  # # DELETE /resource/sign_out
  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    @message = "signed out"
    sign_out(@user)
    render json: @message
  end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private

  def no_user
    render json: {error: "An account with this email doesn't exist. Please create a new one"}, status: :unprocessable_entity
  end

  def invalid_attempt
    render json: { error: "Your password isn't correct" }, status: :unprocessable_entity
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end


  protected

 

  # def respond_with(resource, _opts = {})
  #   render json: {
  #     status: {code: 200, message: "Logged In Successfully"},
  #     data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  #   }, status: :ok
  # end

  # def respond_to_on_destroy
  #   if current_user
  #     render json: {
  #       status: 200
  #       message: 'logged out successfully'
  #     }, status: ok
  #   else
  #     render json: {
  #       status: 401,
  #       message: "Couldn't find an active session"
  #     }, status: :unauthorized
  #   end
  # end 
end
