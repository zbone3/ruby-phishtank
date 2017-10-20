module Phishtank
  class Parser
    def initialize(result)
      @result = result
    end

    # Parse Methods

    def is_valid_phishing?
      @result[:results][:valid]
    end

    def is_verified?
      @result[:results][:verified]
    end

    def verified_at
      @result[:results][:verified_at]
    end

    def in_database?
      @result[:results][:in_database]
    end

    def phishing_site_url
      @result[:results][:url]
    end

    def phishtank_details_url
      @result[:results][:phish_detail_page]
    end

    def phish_id
      @result[:results][:phish_id]
    end
  end
end
