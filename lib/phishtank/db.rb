module Phishtank
  class DB
    def initialize(api_key, format='json', compression=nil)
      @api_key = api_key
      formats = ['json', 'csv', 'php_serialized', 'xml']
      compressions = ['gz', 'bz2']

      # Validate formats
      if (formats.include?(format))
        @format = format
      else
        raise Exception.new("Unknown data format. Please use one of the following: #{formats}")
      end

      # Validate compression methods
      if (compressions.include?(compression))
        @compression = compression
      elsif compression.nil?
        @compression = ''
      else
        raise Exception.new("Unknown compression method. Please use one of the following: #{compressions} or none (nil)")
      end

    end

    # Get the database snapshot from Phishtank.com
    def download
      api_url = build_url
      RestClient::Request.execute(method: 'GET', url: api_url, open_timeout: 20)
    end

    private

    # Create API url
    def build_url
      base_url = "http://data.phishtank.com/data/#{@api_key}/online-valid"

      if @format
        base_url = "#{base_url}.#{@format}"
      end

      if @compression
        base_url = "#{base_url}.#{@compression}"
      end
      base_url
    end
  end
end