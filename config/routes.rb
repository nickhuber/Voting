Voting::Application.routes.draw do
  
  #EDIT ME TO CHANGE ROOT URL
  root :to => 'polls#index'
  
  resources :reports
  
  resources :polls, :shallow => true do
    resources :questions, :shallow => true do
      resources :answers
    end
  end
  
end
