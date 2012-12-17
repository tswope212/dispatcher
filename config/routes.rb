Dispatcher::Application.routes.draw do
  
  devise_for :coordinators
  resources :coordinators

  resources :categories


  resources :notes


  resources :proficiencies


  resources :languages do
    resources :teams
  end


  devise_for :residents
  resources :residents do
    collection do
      post :populate
    end
  end

  resources :task_waivers


  resources :jobs do
    resources :notes
    member do
      put :start
      put :finish
    end
  end


  resources :steps do
    member do
      put 'move_up'
    end
  end


  resources :phase_templates do
    resources :steps
    resources :units do
      post :apply
    end
  end


  resources :signatures


  resources :waivers do
    resources :signatures
  end


  resources :deployments


  devise_for :team_admins, :controllers => { :registrations => :team_admin_registrations, :sessions => :sessions }
  resources :team_admins do
    member do
      get 'activate'
      get 'deactivate'
    end
  end

  match '/registration' => 'tasks#registration', :as => 'assistance_registration'
  match '/request' => 'tasks#intake', :as => 'request_task', :via => :post
  match '/legal_intake' => 'tasks#legal_intake', :as => 'legal_intake', :via => :put
  match '/finish_intake' => 'tasks#finish_intake', :as => 'finish_intake', :via => :put
  resources :operations_centers do
    resources :assignments
  end


  resources :assignments


  resources :aptitudes


  resources :dispatches


  resources :tasks


  resources :skills


  resources :roles do
    member do
      post :join
    end
  end


  resources :teams do
    resources :roles
  end


  devise_for :people, :controllers => { :registrations => :registrations, :sessions => :sessions }
  resources :people

  resources :units do
    resources :residents
    member do
      get :phase
    end
    collection do
      post :upload
    end
  end


  resources :addresses do
    resources :units
  end


  resources :streets


  resources :neighborhoods do
    resources :operations_centers
  end


  resources :cities do
    resources :teams
    resources :deployments
  end
  
  root :to => 'dispatches#introduction'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
