Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  # welcome
  get 'focus_to_section/:section_id', to: 'welcome#focus_to_section', as: 'focus_to_section'
  get 'scroll_to_top', to: 'welcome#scroll_to_top', as: 'scroll_to_top'
  get 'projects_dialog/:project', to: 'welcome#projects_dialog', as: 'projects_dialog'
  get 'services_dialog/:service', to: 'welcome#services_dialog', as: 'services_dialog'
  get 'close_dialog', to: 'welcome#close_dialog', as: 'close_dialog'
  get 'show_project_image/:id', to: 'welcome#show_project_image', as: 'show_project_image'
  get 'close', to: 'welcome#close', as: 'close'
  
  # users
  get 'admin', to: 'users#admin', as: 'admin'
  
  # posts
  get 'carousel_scroll/:direction', to: 'posts#carousel_scroll', as: 'carousel_scroll'
  get 'edit_post_by_tag/:tag', to: 'posts#edit', as: 'edit_post_by_tag'
  delete 'delete/:id', to: 'posts#destroy', as: 'destroy_post'
  
  # contacts
  delete 'clear_contacts', to: 'contacts#destroy_all', as: 'destroy_all_contacts'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  # sessions
  get 'login', to: 'sessions#new', as: 'sessions_new'
  post 'sessions/create', as: 'sessions'
  delete 'sessions/destroy'
  delete 'sessions/destroy_all_other_sessions', as: 'destroy_all_other_sessions'
  
  # pages
  get 'pages/toggle_menu', as: 'toggle_menu'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users
  resources :posts
  resources :contacts

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
