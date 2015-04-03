require 'owd/documents/shipping_rate'
require "test_helper"

describe OWD::ShippingRate do
  before do
    @doc = OWD::ShippingRate.new
  end

  describe "#owd_name" do
    it { assert_equal @doc.owd_name, 'OWD_SHIPPING_RATE_REQUEST' }
  end

  describe "#build" do
    it "builds an XML body with an :order_reference" do
      assert_equal_xml @doc.build(
        shipping_address: {
          address_1: '10 1st ave e',
          city: 'Mobridgee',
          region: 'South Dakota',
          postcode: '57601',
          countrycode: 'US'
        },
        items: [
          {
            sku: 'ABC',
            qty: '1'
          },
          {
            sku: 'DEF',
            qty: '2'
          }
        ],
        shipmethods: [
          { code: 'OWD.1ST.PRIORITY' },
          { code: 'UPS.GND' },
          { code: 'UPS.2DAY' }
        ]
      ), <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <OWD_API_REQUEST>
          <OWD_SHIPPING_RATE_REQUEST>
            <SHIPPING_ADDRESS>
              <ADDRESS_1>10 1st ave e</ADDRESS_1>
              <ADDRESS_2></ADDRESS_2>
              <CITY>Mobridgee</CITY>
              <REGION>South Dakota</REGION>
              <POSTCODE>57601</POSTCODE>
              <COUNTRYCODE>US</COUNTRYCODE>
            </SHIPPING_ADDRESS>
            <ITEMS>
              <ITEM sku="ABC" qty="1" />
              <ITEM sku="DEF" qty="2" />
            </ITEMS>
            <SHIPMETHODS>
              <CODE>OWD.1ST.PRIORITY</CODE>
              <CODE>UPS.GND</CODE>
              <CODE>UPS.2DAY</CODE>
            </SHIPMETHODS>
          </OWD_SHIPPING_RATE_REQUEST>
        </OWD_API_REQUEST>
      XML
    end
  end
end

