Rails.application.routes.draw do
  namespace :api do
		namespace :v1 do
			resources :users, :midpoints, :searches, :locations, :venues, :follows
      post '/conversions/create_conversion', to: 'conversions#create_conversion'
      post '/follows/follow_user', to: 'follows#follow_user'
      post '/follows/my_friends', to: 'follows#my_friends'
      post '/follows/get_friend_info', to: 'follows#get_friend_info'
      post '/follows/unfollow_friend', to: 'follows#unfollow_friend'
      post '/searches/get_user_searches', to: 'searches#get_user_searches'
      post '/users/find_friends', to: 'users#find_friends'
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
		end
	end
end
