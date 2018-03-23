module UrlsHelper

  def url_params
    params.require(:url).permit(:long_url, :short_url)
  end

end
