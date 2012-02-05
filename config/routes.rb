Calendar::Application.routes.draw do
 
 match '/ECE' => 'mains#ece'
 match '/course_description/:id' => 'courses#course_description'
 match '/like_d_thread/:userId/:dThreadId/:vote' => 'd_threads#like_d_thread'
 match '/like_d_thread_reply/:d_thread_id/:userId/:replyId/:vote' => 'replies#like_reply'
 match 'chat/display', :to=> 'chats#chat_display'
  match 'chat/update', :to => 'chats#chat_update'
  match 'chat/message', :to => 'chats#chat_message', :via => :post
 
 resources :eces

  #match 'area/:id' => 'years#areaShow'
  #match 'years/area/:id' => 'years#areaShow'
	
  match 'd_threads/post' => 'd_threads#post'
  #match 'ecedb', :to =>"years#index"
	
  #resources :years
  resources :courses
  resources :d_threads do
  	resources :replies
  end
  resources :tags
  
  resources :allcourses

  resources :courses
  match '/check_course', :to => 'courses#course'
  match '/check_tag', :to => 'd_threads#tag'
#courses
  match '/ece', :to => 'eces#ece'
  match '/ece/', :to => 'eces#ece'
  
  resources :events

  get "calendar/index"

  match '/calendar', :to => 'calendar#index'
#  root :to => "calendar#index"
   resources :supports, :only => [:new, :create]

resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  match '/search', :to => 'users#index'
    match '/qsearch', :to => 'd_threads#search'
  match '/contactus',:to => 'supports#new'
  match '/signin' , :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/sign_up', :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/about'  , :to => 'pages#about'
  match '/help'   , :to => 'pages#help'
  root :to => 'pages#home'


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
  # root :to => "welcome#index"


  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
