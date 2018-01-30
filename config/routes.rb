Rails.application.routes.draw do
  root to: 'intranet#intranet'
  get 'intranet' => 'intranet#intranet'
  get 'intranet' => 'intranet#intranet', as: 'user_root'

  resources :editions, only: [] do
    resources :participants, only: [:index, :show], param: :username
    get 'hall_of_fame' => 'participants#hall_of_fame'
    get 'organizer_of_fame' => 'participants#organizer_of_fame'

    resources :activities, only: [:index, :show] do
      post :register, on: :member
      delete :deregister, on: :member
    end

    resources :badges, only: [:index, :show, :new, :create, :edit, :update] do
      get :redeem, on: :collection, action: :require, as: 'redeem'
      post :redeem, on: :collection, action: :redeem, as: 'redeem_post'
      get 'redeem/:code', on: :collection, action: :redeem, as: 'redeem_get'
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
end
