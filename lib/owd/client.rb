require 'crack'
require 'net/http'
require 'uri'

module OWD
  class Client
    API_VERSION = '1.9'
    ENDPOINT = 'https://secure.owd.com/webapps/api/api.jsp'

    attr_reader :client_id, :client_authorization, :testing

    def initialize opts = {}
      @client_id            = opts[:client_id]
      @client_authorization = opts[:client_authorization]
      @testing              = opts[:testing] ? 'TRUE' : 'FALSE'
    end

    def post document_name, opts = {}
      name = document_name.to_s.camelize
      doc = OWD.const_defined?(name) ? OWD.const_get(name) : OWD.const_missing(name)

      xml = doc.new(:api_version          => API_VERSION,
                    :client_id            => @client_id,
                    :client_authorization => @client_authorization,
                    :testing              => @testing).build(opts)
      extract_response(send_request(xml))
    end

    def send_request xml
      uri = URI.parse(ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')

      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = xml
      request["Content-Type"] = "text/xml"

      http.request(request)
    end

    def extract_response response
      results = Crack::XML.parse(response.body)['OWD_API_RESPONSE']

      if results['results'] == 'ERROR'
        raise APIError.new 'type'    => results['error_type'],
                           'message' => results['error_response']
      end

      results
    end

    def api
      @api ||= SimpleProxy.new(self, :post)
    end
  end
end
