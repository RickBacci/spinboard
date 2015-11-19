class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = current_user.links if current_user
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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Link was successfully updated!"
      redirect_to links_path
    else
      flash[:failure] = "There was a problem updating your link!"

      redirect_to links_path
    end
  end

  def update_status
    link = current_user.links.find(params[:link][:id])

    link.update(status: toggle_link_status(link))
    redirect_to links_path
  end

  private

  def toggle_link_status(link)
    return false if link.status
    true
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
