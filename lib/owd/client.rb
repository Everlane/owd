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
      klass = symbol_to_class_name(document_name)
      document = OWD.const_defined?(klass) ? OWD.const_get(klass) : OWD.const_missing(klass)

      post_document document, opts
    end

    def post_document document, opts = {}
      xml = document.new(:api_version          => API_VERSION,
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
      Crack::XML.parse(response.body)['OWD_API_RESPONSE'].tap do |results|
        if results['results'] == 'ERROR'
          raise APIError.new 'type'    => results['error_type'],
                             'message' => results['error_response']
        end
      end
    end

    def api
      @api ||= SimpleProxy.new(self, :post)
    end

    private
    def symbol_to_class_name sym
      sym.to_s.camelize
    end
  end
end
