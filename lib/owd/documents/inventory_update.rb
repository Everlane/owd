module OWD
  class InventoryUpdate < Document
    def _build opts = {}
      sku = opts.delete(:sku)

      doc.tag!(self.owd_name, sku: sku) do
        opts.each do |key, value|
          doc.tag!(key.upcase, value)
        end
      end
    end
  end
end
