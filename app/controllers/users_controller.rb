class UsersController < ApplicationController

  def index
    @page = params[:page].presence
    if @page
      @users = User.by_karma.page(@page.to_i)
      # binding.pry
    else
      @users = User.by_karma.page
      @page = 1
    end
  end
end
