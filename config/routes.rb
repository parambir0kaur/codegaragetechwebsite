
Rails.application.routes.draw do
  get 'errors/not_found'


  get 'errors/internal_server_error'
  match "/404", :to => "errors#not_found", :via => :all
  # match "/500", :to => "errors#internal_server_error", :via => :all
  get '/admins/sign_up'=>redirect('/about_us')
  devise_for :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'


  get 'about-us'=>'home#about_us'
  # get 'blogs/:id' =>'home#show'/
  get 'contact'=>'home#contact'
  get 'careers'=>'home#careers'
  get 'home/our_work'=>'home#our_work'
  get 'work/project-detail-ucview'=>'home#project_detail1'
  get 'work/project-detail-welcomeai'=>'home#project_detail2'
  get 'work/project-detail-markets-world'=>'home#project_detail3'
  get 'home/blog_page'=>'home#blog_page'
  get 'seo-services'=>"services#seo_services"
  # get 'all_blogs'=>'home#all_blogs'


  resources :blogs
  resources :contacts
  resources :subscribes
  resources :candidates


  get '*a', :to => 'errors#not_found'



end
