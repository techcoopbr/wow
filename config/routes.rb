Rails.application.routes.draw do
  resources :creators
  default_url_options :host => "wowmorreu.com.br"  
  resources :panel

  root to: 'welcome#index'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
