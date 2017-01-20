Rails.application.routes.draw do
	#General routes
	get '/generals' => 'generals#index'
	get '/generals/guild' => 'generals#guild'
	get '/generals/:id' => 'generals#show'
	
	#friendship controller
	get '/friendships/:id'=> 'friendships#show'
	post '/friendships/createfriend'=> 'friendships#create'
	delete '/friendships/deletefriend' => 'friendships#destroy'
	
	#post
	post '/posts'=> 'posts#create'
	
	#comment
	post '/comments'=> 'comments#create'
	# get '/:id/edit' => 'generals#edit'
	# get '/:id' => 'generals#show'
	# patch '/:id' => 'generals#update'
	# delete '/:id' => 'generals#destroy'

	#User routes
	get '/users/signup'=> 'users#new'
	post '/users/create'=>'users#create'

	#Guild
	get '/guilds/newguild' => 'guilds#new'
	get '/guilds/:id'=> 'guilds#show'
	post '/guilds/createguild'=> 'guilds#create'

	#Login routes
	get '/login'=> 'login#new'
	post '/login/create' => 'login#create'
	get '/logout'=>'login#destroy'

	#Stream route
	get'/streams'=> 'streams#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
