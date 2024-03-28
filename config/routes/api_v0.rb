# frozen_string_literal: true

namespace :api do
  namespace :v0 do
    resource :session, only: :create do
      post :refresh
    end
    get 'api_status', to: 'example#index'
  end
end
