Rails.application.routes.draw do
  	namespace :api, defaults: { format: :json } do
	    namespace :v1, defaults: { format: :json } do
	      resource :reservations, only: %i[ create update show]
	  	end
  	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end