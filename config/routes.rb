Voting::Application.routes.draw do
  
  devise_for :users

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
  match 'active_polls/:id', :to => 'active_polls#show', :as => :view_active_poll
  match 'active_polls/:id/next', :to => 'active_polls#next', :as => :next_active_poll
  match 'active_polls/:id/prev', :to => 'active_polls#prev', :as => :prev_active_poll
  
  match ':id/submit', :to => 'active_polls#clicker_submit', :as => :clicker_submit
  
  match ':id', :to => 'active_polls#clicker', :as => :clicker
  
  match 'polls/:id/sort', :to => 'polls#sort', :as => :poll_questions_sort
  
  match 'polls/:poll_id/questions/:q_id/add', :to => 'questions#add_to_poll', :as => :add_to_poll
  match 'polls/:poll_id/questions/:q_id/remove', :to => 'questions#remove_from_poll', :as => :remove_from_poll
  
  match 'active_polls/:id/end', :to => 'active_polls#end', :as => :end_poll
  
end
