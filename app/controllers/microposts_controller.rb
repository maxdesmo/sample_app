class MicropostsController < ApplicationController
  # We don't specify the only actions its applies to, because
  # it will apply to all defined actions by default
  # If we have an action defined such as index, which we don't want
  # the before filter to run on, then we restrict using only:
  before_filter :signed_in_user,  only: [:create, :destroy]
  before_filter :correct_user,    only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      # If save fails, page still expects a feed_items array
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
