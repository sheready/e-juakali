class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin! 

  private

  def this_user
    current_admin
  end
  
  def index
  end
end
