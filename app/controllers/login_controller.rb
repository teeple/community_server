class LoginController < ApplicationController
  def login
  	redirect_to :controller => 'messages', :action => 'index'
  end
end
