NkV1::Application.routes.draw do

 root 'static_pages#launch'
 get "/demo" => "static_pages#home", via: "get"
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
   mount Ckeditor::Engine => '/ckeditor'
   if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
   end
   resources :contact_forms
 devise_for :users , :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'} 
 match '/del_google_calendar_alert', to:'set_alerts#remove_google_calendar_alert', via: 'get'
 match '/del_fb_alert', to:'set_alerts#remove_fb_alert', via: 'delete'
 match '/set_fb_alert', to:'set_alerts#set_fb_alert', via: 'get'
 match '/set_google_calendar_alert', to:'set_alerts#set_google_calendar_alert', via: 'get'
 match '/refresh', to:'refresh#index', via: 'get'
 match '/delfb', to:'push2fb#destroy', via: 'delete'       
 match '/sort', to:'refresh#by_date', via:'get' 
 match '/search', to:'refresh#search', via:'get' 
 match '/myevents', to:'refresh#myevents', via:'get'
 match '/hall', to:'refresh#hallevents', via:'get'
 match '/campus', to:'refresh#campusevents', via:'get'
 match '/approvals', to:'admin#index', via:'get' 
 match '/approve', to:'admin#update', via:'get'                        
 get "users/preferences"

   resources :events do #, shallow: true
      put :favorite, on: :member
        put :followfeed, on: :member
          put :share, on: :member
            put :submit, on: :member
   end
   
   resources :groups, except: [:show, :index]
   resources :campuses do
       resources :groups, only: [:show, :index]      
   end
   resources :users do
     member do
       get :following, :followers
     end
   end
   resources :microposts, :only => [:create, :destroy]
   resources :relationships, :only => [:create, :destroy]

  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/new_events', to: 'static_pages#new_events', via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/team', to: 'static_pages#team', via: 'get'
  match '/faq', to: 'static_pages#faq', via: 'get'
  match '/our_works', to: 'static_pages#our_works', via: 'get'
  match '/patnerships', to: 'static_pages#patnerships', via: 'get'
  
end
