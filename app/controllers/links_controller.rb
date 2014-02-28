class LinksController < ApplicationController
  before_action :require_logged_in, except: [:index, :show]
  before_action :get_link, only: [:edit,:update,:show,:destroy]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(links_params)
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def upvote
    current_user.user_votes.new(link_id: params[:link_id], vote: "up").save
    redirect_to :back
  end

  def downvote
    current_user.user_votes.new(link_id: params[:link_id], vote: "down").save
    redirect_to :back
  end

  def show
  end

  def edit
  end

  def update
    if @link.update_attributes(links_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors].full_messages
      render :edit
    end
  end

  def destroy
    @link.destroy
  end

  private
  def get_link
    @link = Link.find(params[:id])
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def links_params
    params.require(:link).permit(:title, :description, :url, :sub_ids => [])
  end
end
