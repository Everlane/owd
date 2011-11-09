module OWD
  class TestInventorySetcount < Document
    def _build opts = {}
      doc.tag!(self.owd_name) do
        opts.each do |key, value|
          doc.tag!(key.upcase, value)
        end
      end
    end
  end
end
