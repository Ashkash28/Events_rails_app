Rails.application.routes.draw do
 

  get 'events/index'

  get 'events/create'

  # get 'users/new'

  # get 'users/create'

  # get 'users/show'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  root 'users#new'
  resources :users
  resources :sessions, :only => [:new, :create, :destroy] #only need 3 restful routes for Sessions
  get "/signup"  => 'users#new'
  get "/signin" => 'sessions#new'
  get "/signout" => 'sessions#destroy'

  delete 'events/:id', to: 'events#destroy'

  post '/attendees/delete', to:'attendees#destroy'

  get "/events" => 'events#index'

  get '/events/show/:id' => 'events#show'

  get '/users/show/:id' => 'users#show'

  post '/users/update/:id' => 'users#update'

  post 'login' => 'sessions#create'

  resources :events

  resources :attendees

  resources :comments

  # post '/events/create' => 'events#create'

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
