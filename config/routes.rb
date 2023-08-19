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

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :items, only: [:index, :show]
    get '/members/mypage' => "members#show"
    get '/members/information/edit' => "members#edit"
    patch '/members/information' => "members#update"
    get '/members/confirm_quit' => "members#confirm_quit"
    patch '/members/quit' => 'members#quit'
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # admin側

  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update, :index]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
