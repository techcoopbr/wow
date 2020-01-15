Rails.application.routes.draw do
  resources :plataforms
  resources :developers
  resources :games
  resources :meta
  require 'domain_constraint'
  mount Ckeditor::Engine => '/ckeditor'
  resources :blogs#, only: [:new, :edit]
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
  #get 'tags/:tag', to: 'blogs#index', as: "tag"
  get 'result', to: 'perfil#result', as: :public_result
  get ':slug/blog', to: 'perfil#blog', as: :public_creator_blog
  #postagens
  get ':creator/post/:slug', to: 'perfil#post', as: :public_creator_post
  get 'post/:slug', to: 'perfil#post', as: :public_post

  get 'perfil/:slug', :to => 'welcome#creator', as: :public_creator
  get '/:slug', :to => 'perfil#index', as: :public_perfil


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
