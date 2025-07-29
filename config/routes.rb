Rails.application.routes.draw do
  resources :players
  resources :teams

  root "players#index"

  get("/rake_tasks", { :controller => "rake_tasks", :action => "show" })
  get("/run_task", { :controller => "rake_tasks", :action => "run_task" })
end
