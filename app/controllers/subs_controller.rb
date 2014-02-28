class SubsController < ApplicationController
  before_action :require_logged_in, except: [:index, :show]
  before_action :get_sub, only: [:edit, :update, :show, :destroy]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    links = @sub.links.new(link_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors].full_messages
      render :edit
    end
  end

  def destroy
    @sub.destroy
  end

  private
  def get_sub
    @sub = Sub.find(params[:id])
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def sub_params
    params.require(:sub).permit(:title)
  end

  def link_params
    params.permit(links: [:title, :url, :description, :submitter_id])
          .require(:links)
          .values
          .reject {|link| link[:title].blank? && link[:url].blank? }
          .map{|link| link.merge(submitter_id: current_user.id) }

  end
end






















