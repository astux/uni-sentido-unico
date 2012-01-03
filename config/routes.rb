Rails.application.routes.draw do
  namespace :admin do
    resources :partner_institutions
    resources :course_contracts do 
      member do
        get :preview
      end
    end
    resources :courses do
      resources :curriculum_students do
        resources :payments do
          get 'gerar_boleto', :on => :member
        end
      end
    end
  end
end
