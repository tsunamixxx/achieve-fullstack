Rails.application.routes.draw do
  root to: 'blogs#index'
  # get '/blogs', to: 'blogs#index'
  # get '/stocks', to: 'stocks#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :contacts
end
