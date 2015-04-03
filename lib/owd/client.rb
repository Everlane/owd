require 'crack'
require 'net/http'
require 'uri'

module OWD
  class Client
    API_VERSION = '1.9'

    attr_reader :client_id, :client_authorization, :testing

    def initialize opts = {}
      @client_id            = opts[:client_id]
      @client_authorization = opts[:client_authorization]
      @testing              = opts[:testing] ? 'TRUE' : 'FALSE'
    end

    def api
      @api ||= SimpleProxy.new(self, :post)
    end

    def post document_name, opts = {}
      klass = symbol_to_class_name(document_name)
      document = OWD.const_defined?(klass) ? OWD.const_get(klass) : OWD.const_missing(klass)

      post_document document, opts
    end

    private

    def post_document document, opts = {}
      xml = document.new(:api_version          => API_VERSION,
                         :client_id            => @client_id,
                         :client_authorization => @client_authorization,
                         :testing              => @testing).build(opts)
      Request.new(xml).perform
    end

    def symbol_to_class_name sym
      sym.to_s.camelize
    end
  end
end
