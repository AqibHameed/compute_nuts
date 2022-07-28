Rails.application.routes.draw do
  get "/nuts", to: "nuts#index"
  post "/nuts", to: "nuts#maximum_amount_of_nuts"
end
