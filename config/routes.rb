Rails.application.routes.draw do
  # daviceを使用する時にusersを含むことを意味している
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
    # resource・・・idがURLに含まれない　お気に入りはコメントと違い、一つの投稿に対し一つのお気に入り
    resources :post_images, only: [:new, :create, :index, :show, :destroy]do
    resource :favorites, only: [:create, :destroy]

    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end