class Url < ActiveRecord::Base

  before_create :default_values
  before_save :generate_url, on: :create




  private

  def default_values
    self.click_count ||= 0
    self.long_url ||= ''
  end

  def generate_url
    self.short_url = 'shortyurl'
  end

end
