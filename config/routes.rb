Rails.application.routes.draw do
  resources :boards
  devise_for :coaches, controllers: {
  sessions:      'coaches/sessions',
  registrations: 'coaches/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  registrations: 'users/registrations'
}
  root "top#index"
end
