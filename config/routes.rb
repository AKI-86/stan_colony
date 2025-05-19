Rails.application.routes.draw do

  
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
# resources :users, only: []
namespace :admin do
  get 'top' => 'homes#top', as: 'top'
  get 'searches', to: 'searches#search', as: 'search_results'

  resources :users, only: [:index, :show, :edit, :update]
  resources :artists, only: [:index, :new, :show, :edit, :create, :update] do
    resources :topics, only: [:index, :new, :show, :edit, :create, :update] do
      resources :comments, only: [:index, :destroy]
    end
  end
  resources :reports, only: [:index, :show, :update]
  resources :genres, only: [:index, :edit, :create, :update]
  resources :groups, only: [:index, :new, :show, :edit, :create, :update]
end


# ユーザー用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :user do
  post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

# resources :users, only: []
  scope module: :public do
    root 'homes#top'
    get 'homes/about', to: "homes#about"
    get 'searches', to: 'searches#search', as: 'search_results'

    get 'users/mypage', to: "users#mypage"
    get 'users/unsubscribe', to: "users#unsubscribe"
    patch 'users/withdraw', to: "users#withdraw"
    get 'artist_tags/:name', to: 'artist_tags#show', as: 'artist_tag'
    get 'group_tags/:name', to: 'group_tags#show', as: 'group_tag'

    resources :users, only: [:index, :show, :edit, :create, :update] do
      resources :relationships, only: [:create, :destroy]
    end

    resources :artists, only: [:index, :new, :show, :edit, :create, :update] do
      resource :favorites, only: [:create, :destroy]# アーティストごとの「いいね」
      resources :artist_tags, only: [:create, :destroy]
      resources :topics, only: [:new, :show, :edit, :create, :update] do
        resources :topic_tags, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
      end
    end
    
    resources :favorites, only: [:create, :destroy]  # ユーザーによるアーティスト「いいね」
    resources :reports, only: [:create]
    resources :groups, only: [:index, :new, :show, :edit, :create, :update] do
      resource :group_membership, only: [:create, :destroy]
      resources :group_comments, only: [:create, :destroy]
      resources :chat_messages, only: [:index, :create]
    end

  end
end
