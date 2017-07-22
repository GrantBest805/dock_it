Rails.application.routes.draw do
	# session
	root 'sessions#index'
	get 'sessions/new' => 'sessions#new'
	delete 'sessions/:id' => 'sessions#destroy'
	post 'sessions' => 'sessions#create'
	# users
	get 'users/new' => 'users#new'
	post 'users' => 'users#create'
	get 'users/:id' => 'users#show'

	# Groups 
	get 'groups/:id' => 'groups#index'
	post 'groups' => 'groups#create'

	# Title
	post 'titles' => 'groups#add_title'

	# messages
	post 'messages' => 'user#new_message'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
