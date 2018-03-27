class Url < ActiveRecord::Base

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
