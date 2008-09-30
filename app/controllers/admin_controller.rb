class AdminController < ApplicationController
  before_filter :logged_in?, :except => 'login' 
  
  def login
    if request.post? && params[:password] == "barrywhite"
      session[:user] = "MrMonstur"
    end
  end
  
  def logout
    session[:user] = nil
  end

end
