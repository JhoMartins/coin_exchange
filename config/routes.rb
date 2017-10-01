Rails.application.routes.draw do
  root 'home#index'
  post 'exchange', to: 'home#exchange'
  post 'quota_period', to: 'home#quota_period'
end
