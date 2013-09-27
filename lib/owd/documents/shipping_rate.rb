module OWD
  class ShippingRate < Document
    def _build opts = {}
      doc.tag!(self.owd_name) do
        doc.tag!('SHIPPING_ADDRESS') do
          opts[:shipping_address].each do |key, value|
            doc.tag!(key.upcase, value)
          end
        end
        doc.tag!('ITEMS') do
          opts[:items].each do |item|
            doc.tag!('ITEM', item)
          end
        end
        doc.tag!('SHIPMETHODS') do
          opts[:shipmethods].each do |shipmethod|
            doc.tag!('CODE', shipmethod)
          end
        end
        puts doc.inspect
      end
    end
  end
end
