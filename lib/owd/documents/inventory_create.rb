module OWD
  class InventoryCreate < Document
    def _build opts = {}
      opts[:type] ||= 'PHYSICAL'

      doc.tag!(self.owd_name) do
        opts.each do |key, value|
          doc.tag!(key.upcase, value)
        end
      end
    end
  end
end
