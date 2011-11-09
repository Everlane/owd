module OWD
  class InventoryStatus < Document
    def _build opts = {}
      if opts[:filters]
        doc.tag!(self.owd_name) do
          opts[:filters].each do |filt|
            doc.FILTER filt
          end
        end
      else
        doc.tag!(self.owd_name)
      end
    end
  end
end