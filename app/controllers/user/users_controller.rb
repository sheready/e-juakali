class User::UsersController < ApplicationController
  before_action :authenticate_user!, unless: :allowed_access

  private

  def allowed_access
    current_admin
  end

  def this_user
    current_user || current_admin
  end

  def index
  end
end
