Spree::Core::Engine.routes.draw do
  get 'idme', :to => "idme#verification", :as => 'verification'
  namespace :admin do
    resources :idme_settings do
      collection do
        put :publish
      end
    end
  end
  resources :idme_promotion_rule do
    member do
      put :publish
    end
  end
  resources :affinity_group
end
