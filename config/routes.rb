Voting::Application.routes.draw do
  
  resources :reports
  
  #EDIT ME TO CHANGE ROOT URL
  root :to => 'polls#index'
  
  resources :polls, :shallow => true do
    resources :questions, :shallow => true do
      resources :answers
    end
  end
  
end
