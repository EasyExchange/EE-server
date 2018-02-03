Rails.application.routes.draw do
  resources :items
  match 'search', :to => 'items#search', :via => [:get], :as => 'search'
  match 'new', :to => 'items#create', :via => [:post], :as => 'new'
  match 'upload_pic', :to => 'items#upload_pic', :via => [:post], :as => 'upload_pic'

  resources :itempics
  resources :messages
  match 'new_message', :to => 'messages#create', :via => [:post], :as => 'new_message'

  resources :users
  
  match 'me', :to => 'users#me', :via => [:get], :as => 'me'
  match 'me/posted', :to => 'users#me_posted', :via => [:get], :as => 'me/posted'
  match 'me/message', :to => 'users#me_message', :via => [:get], :as => 'me/message'
  match 'me/update', :to => 'users#me_update', :via => [:put], :as => 'me/update'
  match 'create_or_get_user', :to => 'users#create_or_get_user', :via => [:get], :as => 'create_or_get_user'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
