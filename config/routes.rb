Rails.application.routes.draw do
  require 'domain_constraint'
  mount Ckeditor::Engine => '/ckeditor'
  resources :blogs#, only: [:new, :edit]
  resources :creators #do
  #resources :blogs, only: [:index, :show]
  #end
  default_url_options :host => "elfabandida.com.br"
  resources :panel
  resources :control_user

  constraints DomainConstraint.new('wowmorreu.com.br') do
    root :to => 'welcome#morreu'
  end

  constraints DomainConstraint.new('gamershall.gg') do
    root :to => 'welcome#morreu'
  end


  #root to: 'welcome#index'
  get 'blog', to: 'perfil#blog', as: :public_blog
  get ':slug/blog', to: 'perfil#blog', as: :public_creator_blog
  #postagens
  get ':creator/post/:slug', to: 'perfil#post', as: :public_creator_post
  get 'post/:slug', to: 'perfil#post', as: :public_post

  get 'perfil/:slug', :to => 'welcome#creator', as: :public_creator
  get '/:slug', :to => 'perfil#index', as: :public_perfil
  get 'games/:game', to: 'creators#index', as: :game


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
