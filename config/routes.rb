Rails.application.routes.draw do

	#General routes
	get '/' => 'generals#frontpage'
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
	post '/users/search'=> 'users#search'
	post '/users/create'=>'users#create'

	#Guild routes
	get '/guilds/newguild' => 'guilds#new'
	get '/guilds/joinguild' => 'guilds#join'
	get '/guilds/:id'=> 'guilds#show'
	post '/guilds/search'=> 'guilds#search'
	post '/guilds/createguild'=> 'guilds#createGuild'
	post '/guilds/joinguild'=> 'guilds#joinGuild'
	delete '/guilds/deleteguild'=> 'guilds#destroy'

	#Login routes
	get '/login'=> 'login#new'
	post '/login/create' => 'login#create'
	get '/logout'=>'login#destroy'

	#Stream routes
	get'/stream1'=> 'streams#stream1'
	get'/stream2'=> 'streams#stream2'
	get'/stream3'=> 'streams#stream3'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
