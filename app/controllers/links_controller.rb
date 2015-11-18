class LinksController < ApplicationController

  def index
    @user = User.find_by(params[:id]) if current_user
    @link = Link.new
    @links = @user.links
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Link was successfully created!"

      redirect_to links_path
    else
      flash[:failure] = "Link could not be created"

      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
