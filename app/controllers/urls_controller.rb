class UrlsController < ApplicationController

  include UrlsHelper

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.save
    redirect_to urls_path
  end

  def destroy
    @url = Url.destroy(params[:id])
    redirect_to urls_path(@urls)
    flash.notice = "Url '#{@url.short_url}' deleted!"
  end

end
