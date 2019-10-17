Rails.application.routes.draw do
  resources :creators
  default_url_options :host => "elfabandida.com.br"
  resources :panel

  root to: 'welcome#index'
  get 'perfil/:slug', :to => 'welcome#creator', as: :public_creator
  get '/:slug', :to => 'perfil#index', as: :public_perfil


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
