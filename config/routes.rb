Voting::Application.routes.draw do
  
  resources :reports

  #resources :answers

  #resources :polls do
  #  resources :questions
  #end
  
  #EDIT ME TO CHANGE ROOT URL
  root :to => 'polls#index'
  
  resources :polls, do
    resources :questions
  end
  
  resources :questions do
    resources :answers
  end
  
end
