Rails.application.routes.draw do
  devise_for :users
  resources :comments

  resources :stories do
    member do
      put "like", to: "stories#upvote"
      put "dislike", to: "stories#downvote"
    end
    resources :comments
  end

  resources :users

  root "stories#index"
end
