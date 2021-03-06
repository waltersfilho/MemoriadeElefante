Rails.application.routes.draw do
  match '/contacts',     to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :cargos
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"  }
  root to: "pages#home"


  resources :politicos do
      collection do
        match 'search' => 'politicos#search', via: [:get, :post], as: :search
      end
      member do
        put "like", to: "politicos#upvote"
        put "dislike", to: "politicos#downvote"
      end
      resources :comentarios do
        member do
              put "like", to: "comentarios#upvote"
              put "dislike", to: "comentarios#downvote"
        end
      end
      resources :acontecimentos do
        member do
          put "like", to: "acontecimentos#upvote"
          put "dislike", to: "acontecimentos#downvote"
        end
      end
  end
  
  resources :partidos
  
  get '/politicos/cargos/:nome' => 'politicos#show'
  get '/politicos/cargos/:nome/:estado' => 'politicos#show'
  get '/politicos/:id' => 'politicos#show'
  
  get 'mapa'=> 'pages#mapa'
  get 'not_found'=> 'pages#not_found'
  
  get '401'=> 'pages#not_found'
  get '404'=> 'pages#not_found'
  get '422'=> 'pages#not_found'
  get '500'=> 'pages#not_found'
  



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
