Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  root to:'homes#top'
  get 'home/about' => "homes#about"
  resources :books, only: [:new,:create,:index,:show,:destroy,:edit,:update]

  resources :users ,only:[:index,:show,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
