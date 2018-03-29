class UrlsController < ApplicationController

  include UrlsHelper

  def index
    if logged_in?
      @urls = Url.where(:user_id => current_user.id)
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to urls_path
    else
      render 'new'
    end
  end

  def show
  end

  def short_url_route
    @url = Url.find_by_short_url params[:short_url]

    if @url.nil?
      redirect_to urls_path
    else
      @url.increment!(:click_count)
      redirect_to @url.long_url
    end
  end

  def destroy
    @url = Url.destroy(params[:id])
    redirect_to urls_path(@urls)
    flash.notice = "Url '#{@url.short_url}' deleted!"
  end

end
