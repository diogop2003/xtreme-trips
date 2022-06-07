class PagesController < ApplicationController
  def home
    @trails = Trail.all
  end
end
