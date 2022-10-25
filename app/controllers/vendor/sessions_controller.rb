# frozen_string_literal: true

class Vendor::SessionsController < Devise::SessionsController
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
    @vendor = Vendor.find_by_email(vendor_params[:email])
    if @vendor && @vendor.valid_password?(vendor_params[:password])
      sign_in :vendor, @vendor
      render json: @vendor
    elsif @vendor && not(@vendor.valid_password?(vendor_params[:password]))
      invalid_attempt
    else
      no_vendor
    end
  end

  def destroy
    @message = "signed out"
    sign_out(@vendor)
    render json: @message
  end

  private

  def no_vendor
    render json: {error: "An account with this email doesn't exist. Please create a new one"}, status: :unprocessable_entity
  end

  def invalid_attempt
    render json: { error: "Your password isn't correct" }, status: :unprocessable_entity
  end

  def vendor_params
    params.require(:user).permit(:email, :password)
  end

  # # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  # private


  # def respond_with(resource, _opts = {})
  #   render json: {
  #     status: {code: 200, message: "Logged In Successfully"},
  #     data: VendorSerializer.new(resource).serializable_hash[:data][:attributes]
  #   }, status: :ok
  # end




  # def respond_to_on_destroy
  #   if current_vendor
  #     render json: {
  #       status: 200,
  #       message: 'logged out successfully'
  #     }, status: :ok
  #   else
  #     render json: {
  #       status: 401,
  #       message: "Couldn't find an active session"
  #     }, status: :unauthorized
  #   end
  # end

end
