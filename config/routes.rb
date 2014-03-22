FvcApp::Application.routes.draw do
  root :to => 'admin/events#index'
  namespace :admin do
    resources :weeks do
      resources :events
    end
  end
end
