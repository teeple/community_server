ComDev::Application.routes.draw do
  
  root :to => 'users#index'

  resources :events

  resources :sms_notifications

  get 'Management/IMSI', to: 'apis#imsi_ecgi'
  #get 'Management/Tracking', to: 'apis#aaa'
  get 'Management/Tracking', to: 'apis#tracking_on'

  # ECGI 정보 획득 via IMSI
  get 'Management/ECGI', to: 'apis#location_fetch'

  get 'setting', to:'users#setting'

  get 'search', to:'search#search'

  resources :apis     

  resources :message_flags

  resources :relations

  resources :messages

  resources :users
  
  resources :sessions,      only: [:new, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
