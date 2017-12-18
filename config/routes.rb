Rails.application.routes.draw do
  get 'adds/create'

  get 'adds/destroy'

  get 'songs/index'

  get 'songs/:id' => 'songs#index'

  get 'users/:id/playlist' => 'users#playlist'

  # get 'songs/'

  root 'application#index'
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :songs, only: [:create, :destroy]
  resources :adds, only: [:create, :destroy]

end


# Prefix Verb   URI Pattern               Controller#Action
#       users POST   /users(.:format)          users#create
#    new_user GET    /users/new(.:format)      users#new
#   edit_user GET    /users/:id/edit(.:format) users#edit
#        user GET    /users/:id(.:format)      users#show     #will be different for different projects
#             PATCH  /users/:id(.:format)      users#update
#             PUT    /users/:id(.:format)      users#update
#             DELETE /users/:id(.:format)      users#destroy
#    sessions POST   /sessions(.:format)       sessions#create
# new_session GET    /sessions/new(.:format)   sessions#new
#     session DELETE /sessions/:id(.:format)   sessions#destroy

#       songs GET    /songs(.:format)          songs#index
#             POST   /songs(.:format)          songs#create
#        song DELETE /songs/:id(.:format)      songs#destroy
#        adds POST   /adds(.:format)           adds#create
#         add DELETE /adds/:id(.:format)       adds#destroy
