class LinksController < ApplicationController

  def index
    @user = User.find_by(params[:id])
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "Link was successfully created!"

      redirect_to links_path
    else
      flash[:failure] = "There was a problem creating your account."

      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
