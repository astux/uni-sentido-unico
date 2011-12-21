Rails.application.routes.draw do
  namespace :admin do
    resources :partner_institutions
    resources :course_contracts do 
      member do
        get :preview
      end
    end
  end
end