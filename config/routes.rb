Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :bounces, only: [] do
        collection do
          post :consume
        end
      end
    end
  end
end
