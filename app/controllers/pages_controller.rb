class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @trails = Trail.all
  end
end
