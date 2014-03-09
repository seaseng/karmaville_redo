class UsersController < ApplicationController
  
  def index
    @page = params[:page].presence
    # @coder = HTMLEntities.new
    if @page
      @users = User.by_karma.page(@page.to_i)
      # binding.pry
    else
      @users = User.by_karma.page(1)
    end
  end
end
