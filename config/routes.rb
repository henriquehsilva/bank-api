Rails.application.routes.draw do
  
  put 'deposit/:account_number/:value', to: 'accounts#deposit', as: 'deposit'
  put 'take_out/:account_number/:value', to: 'accounts#take_out', as: 'take_out'
  put 'transfer/:account_number/:destinity_account_number/:value', to: 'accounts#transfer', as: 'transfer'
  get 'releases/:account_number', to: 'accounts#releases', as: 'releases'
end
