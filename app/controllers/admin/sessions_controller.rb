# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # include Accessible
  # skip_before_action :check_user, only: :destroy
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  # def new
  #   super
  # end

  # # POST /resource/sign_in
  def create
    @admin = Admin.find_by_email(admin_params[:email])
    if @admin && @admin.valid_password?(admin_params[:password])
      sign_in :admin, @admin
      render json: @admin
    elsif @admin && not(@admin.valid_password?(admin_params[:password]))
      invalid_attempt
    else
      no_admin
    end
  end

  # # DELETE /resource/sign_out
  def destroy
    @message = "signed out"
    sign_out(@admin)
    render json: @message
  end

  private

  def no_admin
    render json: {error: "An account with this email doesn't exist. Please create a new one"}, status: :unprocessable_entity
  end

  def invalid_attempt
    render json: { error: "Your password isn't correct" }, status: :unprocessable_entity
  end

  def admin_params
    params.require(:user).permit(:email, :password)
  end

  # # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # private

  # def respond_with(resource, _opts = {})
  #   render json: {
  #     status: {code: 200, message: "Logged In Successfully"},
  #     data: AdminSerializer.new(resource).serializable_hash[:data][:attributes]
  #   }, status: :ok
  # end

  # def respond_to_on_destroy
  #   if current_admin
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
