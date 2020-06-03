require 'sidekiq/web'

Rails.application.routes.draw do

  resources :publishers
  resources :plataforms
  resources :developers
  resources :games do
    get :get_api_games, on: :collection, as: :get_api_games
  end
  resources :meta
  require 'domain_constraint'
  mount Ckeditor::Engine => '/ckeditor'
  resources :blogs do #, only: [:new, :edit]
    resources :comments
    resources :anonymous_comments
  end
  resources :uploads
  resources :creators #do
  #resources :blogs, only: [:index, :show]
  #end
  default_url_options :host => "elfabandida.com.br"
  resources :panel
  resources :control_user


  constraints DomainConstraint.new('gamershall.gg') do
    root :to => 'perfil#home'
  end

  constraints DomainConstraint.new('localhost:3000') do
    root :to => 'perfil#home'
  end
  #constraints DomainConstraint.new('wowmorreu.com') do
  #show wowmorreu
  if Rails.env.production?
    root :to => 'welcome#index'
  else
  #show garmeshall
    root :to => 'perfil#home'
  end
  #end

  #if Rails.env.production?
     get '404', :to => 'application#page_not_found'
  #end

  #root to: 'welcome#index'
  get 'blog', to: 'perfil#blog', as: :public_blog
  post '/create-notice', to: 'notices#create'
  get '/notifications', to: 'notices#notifications'
  #get 'tags/:tag', to: 'blogs#index', as: "tag"
  get 'result', to: 'perfil#result', as: :public_result
  get ':slug/blog', to: 'perfil#blog', as: :public_creator_blog
  #postagens

  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  get 'gerador/sobremim', to: 'creators#about', as: :creator_about
  get 'gerador/imagens', to: 'creators#image', as: :creator_image
  get 'gerador/social', to: 'creators#social', as: :creator_social
  get 'gerador/embed', to: 'creators#embed', as: :creator_embed
  get 'gerador/metadados', to: 'creators#meta', as: :creator_meta
  get 'gerador/contatos', to: 'creators#contact', as: :creator_contact
  get '/game/:id', to: 'games#game_detail', as: :public_game_detail
  get '/game', to: 'games#game_list', as: :public_game_list
  get 'twitch/live'#, to: 'twitch#live', as: twitch_live

  get ':creator/post/:slug', to: 'perfil#post', as: :public_creator_post
  get 'post/:slug', to: 'perfil#post', as: :public_post

  get 'perfil/:slug', :to => 'welcome#creator', as: :public_creator
  get '/:slug', :to => 'perfil#index', as: :public_perfil
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
