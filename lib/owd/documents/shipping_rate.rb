require 'owd/document'

module OWD
  class ShippingRate < Document
    def _build(attrs = {})
      doc.tag!(self.owd_name) do
        doc.SHIPPING_ADDRESS do
          doc.ADDRESS_1 attrs[:shipping_address][:address_1]
          doc.ADDRESS_2 attrs[:shipping_address][:address_2]
          doc.CITY attrs[:shipping_address][:city]
          doc.REGION attrs[:shipping_address][:region]
          doc.POSTCODE attrs[:shipping_address][:postcode]
          doc.COUNTRYCODE attrs[:shipping_address][:countrycode]
        end

        doc.ITEMS do
          attrs.fetch(:items, []).each do |i|
            doc.ITEM i
          end
        end

        doc.SHIPMETHODS do
          attrs.fetch(:shipmethods, []).each do |m|
            doc.CODE m[:code]
          end
        end
      end
    end
  end
end
