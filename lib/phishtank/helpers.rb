require 'uri'

module Helpers

  # Phishtank requires a full url. This function patches a domain lookup with a scheme
  def handle_url(url)
    if url.index('http').nil?
      url = 'http://' + url
    end
    begin
      URI.parse(url)
    rescue URI::BadURIError
      raise Exception.new('Bad URL. Please pass a valid URL.')
    end
    url
  end

end

