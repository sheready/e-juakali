class Vendor::VendorsController < ApplicationController
  before_action :authenticate_vendor!, only: [:update, :destroy], unless: :allowed_access

  private
  def allowed_access
    current_admin
  end

  def this_user
    current_vendor || current_admin
  end

  

end
