require 'active_support/core_ext/string'
require 'builder'

module OWD
  class Document
    def initialize attributes = {}
      @attributes = attributes
      @doc        = Builder::XmlMarkup.new
    end

    def owd_name
      "OWD_%s_REQUEST" % self.class.name.split('::').last.underscore.upcase
    end

    def build opts = {}
      doc.instruct!(:xml, :encoding => 'UTF-8')
      doc.OWD_API_REQUEST(@attributes) do
        self._build(opts)
      end

      doc.target!
    end

    private
    def doc
      @doc
    end
  end

  class SimpleInlineDocument
    def _build opts = {}
      doc.tag!(self.owd_name, opts)
    end
  end
end

Dir[File.dirname(__FILE__) + "/documents/*.rb"].each do |file|
  require file
end
