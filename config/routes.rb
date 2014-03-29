FvcApp::Application.routes.draw do

  root :to => 'admin/events#index'
  namespace :admin do
    resources :weeks do
      resources :events
      resources :babysittings
      get "single_day_babysiting" => 'babysittings#single_day'
    end
  end

  namespace :api do
    namespace :v1 do
      match 'login' => 'users#login'
      match 'load_data' => 'users#load_data'
    end
  end
end
