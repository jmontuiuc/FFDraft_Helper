Rails.application.routes.draw do

  # Routes for the Player_projection resource:
  # CREATE
  get('/player_projections/new', { :controller => 'player_projections', :action => 'new' })
  get('/create_player_projection', { :controller => 'player_projections', :action => 'create' })

  # READ
  get('/player_projections', { :controller => 'player_projections', :action => 'index' })
  get('/player_projections/:id', { :controller => 'player_projections', :action => 'show' })

  # UPDATE
  get('/player_projections/:id/edit', { :controller => 'player_projections', :action => 'edit' })
  get('/update_player_projection/:id', { :controller => 'player_projections', :action => 'update' })

  # DELETE
  get('/delete_player_projection/:id', { :controller => 'player_projections', :action => 'destroy' })
  #------------------------------

  devise_for :users
  root 'leagues#index'

  # Routes for the League resource:
  # CREATE
  get('/leagues/new', { :controller => 'leagues', :action => 'new' })
  get('/create_league', { :controller => 'leagues', :action => 'create' })

  # READ
  get('/leagues', { :controller => 'leagues', :action => 'index' })
  get('/leagues/:id', { :controller => 'leagues', :action => 'show' })

  # UPDATE
  get('/leagues/:id/edit', { :controller => 'leagues', :action => 'edit' })
  get('/update_league/:id', { :controller => 'leagues', :action => 'update' })

  # DELETE
  get('/delete_league/:id', { :controller => 'leagues', :action => 'destroy' })
  #------------------------------


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
