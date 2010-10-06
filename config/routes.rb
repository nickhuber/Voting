Voting::Application.routes.draw do
  
  resources :polls do
    resources :questions
  end
end
