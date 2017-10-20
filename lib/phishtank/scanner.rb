module Phishtank
  class Scanner
    attr_reader :format

    def initialize(api_key)
      @api_key = api_key
      @format = 'json'
    end

    def scan(url)
      # Init parser
      client = Phishtank::Raw.new(@api_key, @format)
      response = JSON.parse(client.check_url(url), :symbolize_names => true)

      # Validate server response
      if response[:meta][:status] == 'success'
        # Request Succeeded
        return Phishtank::Parser.new(response)
      else
        raise Exception.new('Bad Response from Phishtank.')
      end
    end
  end
end