Rails.application.routes.draw do
  resources :projects, except: [:show] do
    member do
      get 'toggle_status'
    end
    resources :faqs, except: [:index, :show]
  end
  get 'project/:id', to: 'projects#show', as: 'project_show'
  get 'review-projects', to: 'projects#review'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#home'
end
