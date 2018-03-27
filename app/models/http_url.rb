class HttpUrlValidator < ActiveModel::EachValidator

  require 'net/http'

  def self.compliant?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
    url = URI.parse(value)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path if url.path.present?
    res = req.request_head(path || '/')
    if res.kind_of?(Net::HTTPRedirection)
      url_exist?(res['location']) # Go after any redirect and make sure you can access the redirected URL
    else
      ! %W(4 5).include?(res.code[0]) # Not from 4xx or 5xx families
    end
  rescue Errno::ENOENT
    false #false if can't find the server
  rescue URI::InvalidURIError
    false #false if URI is invalid
  rescue SocketError
    false #false if Failed to open TCP connection
  rescue Errno::ECONNREFUSED
    false #false if Failed to open TCP connection
  rescue Net::OpenTimeout
    false #false if execution expired
  rescue OpenSSL::SSL::SSLError
    false
  end

  def validate_each(record, attribute, value)
    unless value.present? && self.class.compliant?(value)
      record.errors.add(attribute, "is not a valid HTTP URL")
    end
  end

end
