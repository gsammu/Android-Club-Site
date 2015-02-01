Rails.application.routes.draw do

  root 'home#home'

  # Session control
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'logout', :to => 'sessions#destroy', :as => :logout
  end

end
