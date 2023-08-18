Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root 'public/homes#top'
  get '/about' => 'public/homes#about'

  # public側
  resources :items, only: [:index, :show]
  get '/members/mypage' => "public/members#show"
  get '/members/information/edit' => "public/members#edit"
  patch '/members/information' => "public/members#update"
  get '/members/confirm_quit' => "public/members#confirm_quit"
  patch '/members/quit' => 'public/members#quit'
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete 'destroy_all'
    end
  end
  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      post 'confirm'
      get 'complete'
    end
  end
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  # admin側

  namespace :admin do
    root 'admin/homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
