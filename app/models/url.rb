class Url < ActiveRecord::Base

  require 'http_url'
# Validate via Regex:
#  validates :long_url, format: {with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix,
#    message: "only allows correct URLs using, e.g., http:// or https://" }

# 'http_url: true' below calls the class of same name (in same directory)
  validates :long_url, http_url: true
  before_create :default_values
  before_create :generate_url


  private

  def default_values
    self.click_count ||= 0
    self.long_url ||= ''
  end

  def generate_url
    chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
    self.short_url = 6.times.map{chars.sample}.join
    self.short_url = 6.times.map{chars.sample}.join until Url.find_by_short_url(self.short_url).nil?
  end

end
