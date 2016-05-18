Rails.application.routes.draw do
   get 'studios' => 'studios#index'
   resources :studios do
     resources :reviews
   end
end
