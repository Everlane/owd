module OWD
  class Request
    ENDPOINT = 'https://secure.owd.com/webapps/api/api.jsp'

    attr_reader :xml

    def initialize(xml)
      @xml = xml
    end

    def perform
      uri = URI.parse(ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')

      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = xml
      request["Content-Type"] = "text/xml"

      parse_response(http.request(request))
    end

    private

    def parse_response(response)
      Crack::XML.parse(response.body)['OWD_API_RESPONSE'].tap do |results|
        if results['results'] == 'ERROR'
          raise APIError.new 'type'    => results['error_type'],
                             'message' => results['error_response']
        end
      end
    end
  end
end
