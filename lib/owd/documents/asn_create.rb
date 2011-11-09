module OWD
  class AsnCreate < Document
    def _build opts = {}
      asn_items = opts.delete(:asnitems)

      doc.tag!(self.owd_name) do
        opts.each do |key, value|
          doc.tag!(key.upcase, value)
        end

        if asn_items
          doc.ASNITEMS do
            asn_items.each do |asn_item|
              doc.ASNITEM do
                asn_item.each do |key, value|
                  doc.tag!(key.upcase, value)
                end
              end
            end
          end
        end
      end
    end
  end
end
