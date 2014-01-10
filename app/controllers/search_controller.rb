class SearchController < ApplicationController

	def search
		@keyword = params[:keyword]? params[:keyword] : ''

    @tab_class = Hash.new
    @tab_class = {:users => 'btn-default',:messages => 'btn-default'}
     
    @tab = params[:tab]? params[:tab] : 'users'
    
    @tab_class[@tab.to_sym] = 'btn-primary'

    @users = nil
    @messages = nil

    page_num = params[:page]? params[:page] : 1

    if @keyword != ''
    	@users = User.search(@keyword,page_num)
    	@messages = Message.search(@keyword,page_num)
    end

  end

end
