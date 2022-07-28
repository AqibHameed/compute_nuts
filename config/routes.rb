Rails.application.routes.draw do
  root to: 'nuts#index'
  post "/", to: "nuts#maximum_amount_of_nuts"
end
