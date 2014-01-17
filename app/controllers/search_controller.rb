class SearchController < ApplicationController
    # before_action :signed_in_user
    
  def search
    @keyword = params[:keyword]? params[:keyword] : ''

    @tab_class = Hash.new
    @tab_class = {:users => 'btn-deactive',:messages => 'btn-deactive'}
     
    @tab = params[:tab]? params[:tab] : 'users'
    
    @tab_class[@tab.to_sym] = 'btn-active'

    @users = nil
    @messages = nil

    page_num = params[:page]? params[:page] : 1

    if @keyword != ''
    	@users = User.search(@keyword,page_num)
    	@messages = Message.search(@keyword,page_num)
    end

  end

end
