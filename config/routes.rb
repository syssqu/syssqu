Rails.application.routes.draw do
  #get "/change_day_select"
  match '/service',    to: 'static_pages#service',    via: :get
  match '/profile_company',    to: 'static_pages#profile_company',    via: :get
  match '/policy',    to: 'static_pages#policy',    via: :get
  match '/profile_staff',    to: 'static_pages#profile_staff',    via: :get
  match '/access',    to: 'static_pages#access',    via: :get
  match '/inquiry',    to: 'static_pages#inquiry',    via: :get
  match '/news',    to: 'static_pages#news',    via: :get
  match '/executive', to: 'static_pages#executive', via: :get
  match '/recruit', to: 'static_pages#recruit', via: :get
  match '/member', to: 'static_pages#member', via: :get
  match '/fresh', to: 'static_pages#fresh', via: :get
  match '/career', to: 'static_pages#career', via: :get
  match '/entry', to: 'static_pages#entry', via: :get
  match '/mail_send', to: 'static_pages#mail_send', via: :post
  match '/history', to: 'static_pages#history', via: :get
  match '/jouhouhogo', to: 'static_pages#jouhouhogo', via: :get
  match '/change_day_select', to: 'static_pages#change_day_select', via: :get

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

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
