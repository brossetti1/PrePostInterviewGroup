# == Route Map
#
#                   Prefix Verb   URI Pattern                                            Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                               sessions#new
#             user_session POST   /users/sign_in(.:format)                               sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                              sessions#destroy
#            user_password POST   /users/password(.:format)                              devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                          devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                         devise/passwords#edit
#                          PATCH  /users/password(.:format)                              devise/passwords#update
#                          PUT    /users/password(.:format)                              devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                                registrations#cancel
#        user_registration POST   /users(.:format)                                       registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                               registrations#new
#   edit_user_registration GET    /users/edit(.:format)                                  registrations#edit
#                          PATCH  /users(.:format)                                       registrations#update
#                          PUT    /users(.:format)                                       registrations#update
#                          DELETE /users(.:format)                                       registrations#destroy
#       company_job_events GET    /company/:company_id/jobs/:job_id/events(.:format)     events#index
#                          POST   /company/:company_id/jobs/:job_id/events(.:format)     events#create
#        company_job_event PATCH  /company/:company_id/jobs/:job_id/events/:id(.:format) events#update
#                          PUT    /company/:company_id/jobs/:job_id/events/:id(.:format) events#update
#                          DELETE /company/:company_id/jobs/:job_id/events/:id(.:format) events#destroy
#             company_jobs GET    /company/:company_id/jobs(.:format)                    jobs#index
#                          POST   /company/:company_id/jobs(.:format)                    jobs#create
#              company_job GET    /company/:company_id/jobs/:id(.:format)                jobs#show
#                          PATCH  /company/:company_id/jobs/:id(.:format)                jobs#update
#                          PUT    /company/:company_id/jobs/:id(.:format)                jobs#update
#                          DELETE /company/:company_id/jobs/:id(.:format)                jobs#destroy
#            company_index GET    /company(.:format)                                     company#index
#                          POST   /company(.:format)                                     company#create
#                  company GET    /company/:id(.:format)                                 company#show
#                          PATCH  /company/:id(.:format)                                 company#update
#                          PUT    /company/:id(.:format)                                 company#update
#                          DELETE /company/:id(.:format)                                 company#destroy
#           company_detail GET    /company_detail(.:format)                              company#companies
#           update_profile POST   /user_profile(.:format)                                user_profile#update
#          destroy_profile DELETE /user_profile(.:format)                                user_profile#destroy
#             show_profile GET    /user_profile(.:format)                                user_profile#show
#

Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations",
                                      :sessions => "sessions" }


  resources :company, only: [:index, :create, :show, :update, :destroy] do
    resources :jobs, only: [:index, :create, :show, :update, :destroy] do
      resources :events, only: [:index, :create, :index, :update, :destroy]
    end
  end

  get 'company_detail', to: 'company#companies', as: :company_detail

  post 'user_profile', to: 'user_profile#update', as: :update_profile
  delete 'user_profile', to: 'user_profile#destroy', as: :destroy_profile
  get 'user_profile', to: 'user_profile#show', as: :show_profile
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
