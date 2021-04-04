class UsersController < ApplicationController

	def index
		@new_book = Book.new
		@users = User.all
	end

	def show
		@new_book = Book.new
		if params[:id] == nil
			@user = User.find(current_user)
		elsif
			@user = User.find(params[:id])
		end
	end

	def edit
		@user = User.find(params[:id])
		unless @user.id == current_user.id
			redirect_to user_path(current_user.id)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "You have updated user successfully."
		redirect_to user_path(@user)
	else
		render action: :edit
	end
	end

	private

	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
