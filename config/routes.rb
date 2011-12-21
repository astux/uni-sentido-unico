Rails.application.routes.draw do
  namespace :admin do
    resources :partner_institutions
  end
end