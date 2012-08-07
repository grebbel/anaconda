Anaconda::Application.routes.draw do
  
  root :to => 'dashboard#index'
  
  resources :tags
  resources :colors, :only => :index
  resources :targets
  resources :assays
  resources :requests
  resources :request_generators, :only => [:new, :create]
  resources :amplification_generators, :only => [:new, :create]
  resources :tasks, :only => [ :index, :show, :update ]
  post '/tasks/:id/assign_to_user', :controller => :tasks, :action => :assign_to_user, :as => :assign_task_to_user
  resources :analyses
  
  scope :controller => :pages do
    get :action => :admin, :path => '/admin', :as => :admin
    get :action => :work, :path => '/work',:as => :work
  end
  
  scope :controller => :data_management, :path => '/data-management' do
    get :action => :index, :as => :data_management
    delete :action => :destroy_all_requests, :path => 'all_requests', :as => :destroy_all_requests
  end

  devise_for :users

end
