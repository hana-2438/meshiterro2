Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }


  root to: "homes#top"
  get 'homes/about' => 'homes#about', as:'about'


  namespace :admin do
    root to: "homes#top"
  end

  scope module: :user do
    resources :post_images, only: [:new, :create, :index, :show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
