Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'home/about'=>"homes#about",as: 'about'

  resources :books,only:[:index,:edit,:new,:create,:show,:create,:destroy,:update]

  resources :users,only:[:index,:edit,:new,:update,:show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
