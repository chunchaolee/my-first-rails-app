class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# Rails 內建了一個非常簡單的 HTTP 認證系統，建立Admin

private

def authenticate
  authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == '0987'
  end
end
  
end
