Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }


  get 'contacts/new'

  get 'contacts/create'

resources :blogs, only: [:index, :new, :create, :edit, :update ,:destroy] do
  collection do
    post :confirm
  end
end

resources :contacts, only:[:new, :create] do
  collection do
    post :contact_confirm
  end
end



root 'top#index'
end
