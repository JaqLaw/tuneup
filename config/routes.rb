Rails.application.routes.draw do
  root "pages#home"
  get "recommendations", to: "recommendations#my_recommendations"
end
