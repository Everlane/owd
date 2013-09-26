module OWD
  class InventoryStatus < Document
    def _build opts = {}
      if opts[:filters]
        doc.tag!(self.owd_name) do
          opts[:filters].each do |filt|
            doc.tag!('FILTER') do
              filt.each do |key, value|
                doc.tag!(key.upcase, value)
              end
            end
          end
        end
      else
        doc.tag!(self.owd_name)
      end
    end
  end
end
