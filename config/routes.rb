Spree::Core::Engine.routes.draw do
  get '/idme', :to => "idme#verification", :as => 'verification'
end
