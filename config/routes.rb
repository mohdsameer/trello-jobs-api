Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: "welcome#home"
 get "log_out" => "sessions#destroy", :as => "log_out"
 get '/auth/:provider/callback', to: 'sessions#create'
 resources :jobs
 resources :job_applications
end
