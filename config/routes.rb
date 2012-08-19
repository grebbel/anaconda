Anaconda::Application.routes.draw do
  
  root :to => 'dashboard#index'
  scope :controller => :pages do
    get :action => :admin, :path => '/admin', :as => :admin
    get :action => :work, :path => '/work',:as => :work
  end  
  resources :tags
  resources :colors, :only => :index
  resources :targets
  resources :assays
  resources :analyses
  resources :requests
  resources :import_definitions
  resources :request_generators, :only => [:new, :create]
  resources :amplification_generators, :only => [:new, :create]
  resources :tasks, :only => [ :index, :show, :update ]
  scope :controller => :data_management, :path => '/data-management' do
    get :action => :index, :as => :data_management
    delete :action => :destroy_all_requests, :path => 'all_requests', :as => :destroy_all_requests
  end
  
  post '/tasks/:id/assign_to_user', :controller => :tasks, :action => :assign_to_user, :as => :assign_task_to_user
  scope :controller => :analyses, :path => '/analyses' do
    post 'calculate_ct', :action => :calculate_ct, :as => :calculate_ct
    post 'update_results', :action => :update_results, :as => :update_analyses_results
    post ':id/import_amplifications', :action => :import_amplifications, :as => :import_amplifications
  end
  
  devise_for :users

end
