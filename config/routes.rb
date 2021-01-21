Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :boards
  resources :debates, only: [:index, :new, :create, :destroy] do
    resources :comments, only: [:index, :create]
  end
  devise_for :coaches, controllers: {
  sessions:      'coaches/sessions',
  registrations: 'coaches/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  registrations: 'users/registrations'
}
  root "debates#index"
end
