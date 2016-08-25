Rails.application.routes.draw do

  #Roots
  root 'home#index'
  get '/home' => 'contacts#home', as: :home
  get '/welcome' => 'home#index', as: :welcome

  #Routes contacts/contactperson
  resources :contacts do
    resources :contactpsns
  end

  get 'contactpsns/history' => 'contactpsns#history', as: :contactpsns_history
  get '/contacthistory' => 'contacts#history', as: :contacts_history
  get 'meetings/history' => 'meetings#history', as: :meetings_history

  #Routes Meetings
  resources :meetings

  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, :only => [:index, :show, :edit]

end
