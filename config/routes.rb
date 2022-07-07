Rails.application.routes.draw do
  # daviceを使用する時にusersを含むことを意味している
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
