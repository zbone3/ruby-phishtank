module Phishtank
  class Raw
    def initialize(api_key, format='json')
      @api_key = api_key
      formats = ['json', 'php', 'xml']

      # Validate formats
      if (formats.include? (format))
        @format = format
      else
        raise Exception.new("Unknown data format. Please use one of the following: #{formats}")
      end
    end

    # Validate the url against the Phishtank API
    def check_url(url)
      # Prepend HTTP scheme to domain lookups
      url = handle_url(url)
      base_url = 'http://checkurl.phishtank.com/checkurl/'
      resp = RestClient::Request.execute(method: 'POST', url: base_url, payload: {url: url, format: @format, app_key: @api_key}, open_timeout: 20)
      resp.to_s
    end
  end
end