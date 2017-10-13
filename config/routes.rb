Rails.application.routes.draw do
  namespace :api do
		namespace :v1 do
			resources :users, :midpoints, :searches, :locations, :venues, :follows
      post '/follows/follow_user', to: 'follows#follow_user'
      post '/searches/get_user_searches', to: 'searches#get_user_searches'
      post '/users/find_friends', to: 'users#find_friends'
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
		end
	end
end
