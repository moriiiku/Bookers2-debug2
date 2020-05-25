class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]




  def show
  	@user = User.find(params[:id])
  	@booknew = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @books = @user.books
  end

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
    @usersr = current_user
  	@booknew = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）

  end

  def edit
  	@user = User.find(params[:id])
  end

  def update

   #  if params[:image]
   #  @user.image_name = "#{@user.id}.jpg"
   #  image = params[:image]
   #  File.binwrite("public/user_images/#{@user.image_name}", image.read)
   # end

      @user = User.find(params[:id])
      if @user.update(user_params)
  		redirect_to user_path(@user.id), notice: "You have updated user successfully."
  	else
  		render "edit"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

   def correct_user
    unless User.find(params[:id]).id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end


end
