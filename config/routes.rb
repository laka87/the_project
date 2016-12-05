Rails.application.routes.draw do

  #Roots
  root 'home#index'
  get '/home' => 'contacts#home', as: :home
  get '/welcome' => 'home#index', as: :welcome

  #Routes contacts/contactperson
  resources :contacts do
    resources :contactpsns
  end



  get '/contactsauto' => 'contacts#autocomplete', as: :autocomplete
  get 'contactpsns/history' => 'contactpsns#history', as: :contactpsns_history
  get '/contacthistory' => 'contacts#history', as: :contacts_history
  get 'meetings/history' => 'meetings#history', as: :meetings_history

  #Routes Meetings
  resources :meetings do
    member do
      patch :complete
    end
  end



  devise_for :users
  resources :users
end
