Reddit::Application.routes.draw do
  resources :users
  resource :session
  resources :subs
  resources :links do
    post 'upvote'
    post 'downvote'
    resources :comments, except: [:destroy]
  end


  resources :comments, only: [:destroy]

end
