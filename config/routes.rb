Rails.application.routes.draw do

  #http://localhost:3000/users/sign_in
  devise_for :users, path: 'users', 
                    path_names: {
                      sign_in: 'login',
                      sign_out: 'logout',
                      registration: 'signup'
                    },
                    controllers: {
                    sessions: 'user/sessions',
                    passwords: 'user/passwords',
                    registrations: 'user/registrations'
  } 
  #http://localhost:3000/admins/sign_in
  devise_for :admins, path: 'admins',
                      path_names: {
                        sign_in: 'login',
                        sign_out: 'logout',
                        registration: 'signup'
                      },
                      controllers: {
                        sessions: 'admin/sessions',
                        passwords: 'admin/passwords',
                        registrations: 'admin/registrations'
                      }

  #http://localhost:3000/admins/sign_in
  devise_for :vendors, class_name: 'Vendor', path: 'vendors',
                        path_names: {
                          sign_in: 'login',
                          sign_out: 'logout',
                          registration: 'signup'
                        },
                       controllers: {
                          sessions: 'vendor/sessions',
                          passwords: 'vendor/passwords',
                          registrations: 'vendor/registrations'
                       }
  # devise_scope :admin do
  #   authenticated :admin do
  #     namespace :admin do
  #       get 'admins/index',  as: :authenticated_root
  #     end
  #     # root 'admin/admins#index', as: :auth_admin_root
  #   end
  # end
  
  # devise_scope :user do
  #   authenticated :user do
  #     namespace :user do
  #       get 'users/index',  as: :authenticated_root
  #     end
  #     # root 'user/users#index', as: :auth_user_root
  #   end
  # end

  # devise_scope :vendor do
  #   authenticated :vendor do
  #     namespace :vendor do
  #       get 'vendors/index', as: :authenticated_root
  #     end
  #     # root 'vendor/vendors#index', as: :auth_vendor_root
  #   end
  # end

  # # namespace :admins do
  # #   get 'admins/index'
  # # end
  # # get '/admins', to: 'admin/admins#index', as: :admins

  # # namespace :vendors do
  # #   get 'vendors/index'
  # # end 
  # # get '/vendors', to: 'vendor/vendors#index', as: :vendors

  # namespace :users do
  #   get 'users/index'
  # end 
  # get '/users', to: 'user/users#index', as: :users
                      
  get 'orders', to:'orders#index'
  get 'products', to:'products#index'
  root to: 'orders#index'
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
