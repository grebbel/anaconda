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
  resources :request_generators, :only => [:new, :create]
  resources :amplification_generators, :only => [:new, :create]
  resources :tasks, :only => [ :index, :show, :update ]
  scope :controller => :data_management, :path => '/data-management' do
    get :action => :index, :as => :data_management
    delete :action => :destroy_all_requests, :path => 'all_requests', :as => :destroy_all_requests
  end
  
  post '/tasks/:id/assign_to_user', :controller => :tasks, :action => :assign_to_user, :as => :assign_task_to_user
  post '/analyses/calculate_ct', :controller => :analyses, :action => :calculate_ct, :as => :calculate_ct
  post '/analyses/update_results', :controller => :analyses, :action => :update_results, :as => :update_analyses_results
  
  devise_for :users

end
