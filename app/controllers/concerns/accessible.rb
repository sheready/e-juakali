module Accessible
    extend ActiveSupport::Concern
    included do
        before_action :check_user
    end

    protected
    def check_user
        if admin_signed_in?
            flash.clear
            # The authenticated admin root path can be defined in your routes.rb in: devise_scope :admin do...
            redirect_to(admin_authenticated_root_path) and return
        elsif user_signed_in?
            flash.clear
            # The authenticated user root path can be defined in your routes.rb in: devise_scope :admin do...
            redirect_to(user_authenticated_root_path) and return
        
        elsif vendor_signed_in?
            flash.clear
            # The authenticated vendor root path can be defined in your routes.rb in: devise_scope :user do...
            redirect_to(vendor_authenticated_root_path) and return
        end  
    end
end  
    