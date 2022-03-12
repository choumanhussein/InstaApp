class LovesController < ApplicationController
  def create
    love = current_user.loves.create(blog_id: params[:blog_id])
    redirect_to blogs_path
  end

  def destroy
    love = current_user.loves.find_by(id: params[:id]).destroy
    redirect_to blogs_path
  end

end
