Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #自動建立7個controller#action 路徑資源
  resources :tasks

  #設定根目錄（Root）
  root "tasks#index"
end
