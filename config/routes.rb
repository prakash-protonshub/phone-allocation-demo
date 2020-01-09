Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # allocate specific phone number
  post '/phones/:id', to: 'allocations#specific_number_allocation'
  # allocated random phone number
  post '/phones', to: 'allocations#create'
  # get all allocated phone numbers
  get '/phones', to: 'allocations#index'
end
