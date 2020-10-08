class HomePageController < ApplicationController
  def home
    @active_users = User.all.count()
  end
end
