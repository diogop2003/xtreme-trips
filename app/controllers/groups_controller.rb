class GroupsController < ApplicationController
  def index
    @groups = Groups.all
  end

  def show
    @group = Groups.find(params[:id])
  end

  def new
    @group = Groups.new
  end

  def create
    @group = Groups.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @groups = Groups.find(params[:id])
  end

  def update
    @groups = Groups.find(params[:id])
    if @groups.update(groups_params)
      redirect_to groups_path, notice: "Your group was updated!"
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
