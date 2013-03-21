SpringFling::Application.routes.draw do
 
 resources :artists
 
 root :to => "artists#home"
 
end
