Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations:      'users/confirmations',
    passwords:          'users/passwords',
    registrations:      'users/registrations',
    sessions:           'users/sessions',
    unlocks:            'users/unlocks'

  }

  devise_scope :user do
    get "done", to: 'users/registrations#done', as: :user_registration_done
  end

  root to: "home#index"

  get "mypage" => "mypage#index", as: :mypage

  get "pages/:title" => "pages#show", as: :page
end
