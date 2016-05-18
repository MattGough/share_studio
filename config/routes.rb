Rails.application.routes.draw do
   get 'studios' => 'studios#index'
   resources :studios
end
