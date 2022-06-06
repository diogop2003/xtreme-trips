class UserGroupsController < ApplicationController
  def create
    @user_group = User_group.new(user_group_params)
    @user_group.user = current_user
    authorize @user_group
    if @user_group.save
      redirect_to root_path, notice: "Your product was created!"
    else
      render :new
    end
  end

  def update
    @user_group = User_group.find(params[:id])
    if @user_group.update(user_group_params)
      redirect_to user_groups_path, notice: "Your product was updated!"
    else
      render :edit
    end
  end

  def destroy
    @user_group = User_group.find(params[:id])
    @user_group.destroy
    redirect_to user_groups_path, alert: "Your product has been deleted"
  end

  private

  def user_group_params
    params.require(:user_group).permit(:aproved)
  end
end
