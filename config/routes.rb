Voting::Application.routes.draw do
  
  #EDIT ME TO CHANGE ROOT URL
  root :to => 'polls#index'
  
  resources :reports
  
  resources :polls, :shallow => true do
    resources :questions, :shallow => true do
      resources :answers
    end
  end
  
  #for presenting a poll
  match 'polls/:id/present', :to => 'polls#present', :as => :poll_present
  
  #for viewing/manager an active poll
  match 'active_polls/:id', :to => 'active_polls#show'
  
end
