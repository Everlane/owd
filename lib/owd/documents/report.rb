module OWD
  class Report < Document
    def _build opts = {}
      doc.tag!(self.owd_name) do
        opts.each do |key, value|
          doc.tag!(key, value)
        end
      end
    end
  end
end
