# frozen_string_literal: true

namespace :api do
  namespace :v0 do
    resource :session, only: :create do
      post :refresh
    end
  end
end
