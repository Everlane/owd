module OWD
  class InventoryCount < Document
    def _build opts = {}
      # We're going to fuck this up so many times,
      # use SKU instead of part_reference

      opts[:part_reference] = opts.delete(:sku) if opts[:sku]

      doc.tag!(self.owd_name, opts)
    end
  end
end
