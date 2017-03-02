require 'owd/documents/order_update'
require 'test_helper'

describe OWD::OrderUpdate do
  before do
    @doc = OWD::OrderUpdate.new
  end

  describe '#owd_name' do
    it { assert_equal @doc.owd_name, 'OWD_ORDER_UPDATE_REQUEST' }
  end

  describe '#build' do
    it 'builds an XML body with an :order_reference' do
      assert_equal_xml @doc.build(
        order_reference: 123,
        first_name: "Joe",
        address_one: "300 Webster Street",
        city: "Oakland",
        state: "CA",
        email: "email@gmail.com",
        zip: "94607",
        country: "US",
        phone: "555-5555"
      ), <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <OWD_API_REQUEST>
          <OWD_ORDER_UPDATE_REQUEST clientOrderId="123">
            <SHIP_NAME>Joe</SHIP_NAME>
            <SHIP_ADDRESS_ONE>300 Webster Street</SHIP_ADDRESS_ONE>
            <SHIP_CITY>Oakland</SHIP_CITY>
            <SHIP_STATE>CA</SHIP_STATE>
            <SHIP_POSTCODE>94607</SHIP_POSTCODE>
            <SHIP_COUNTRY>US</SHIP_COUNTRY>
            <SHIP_PHONE>555-5555</SHIP_PHONE>
            <SHIP_EMAIL>email@gmail.com</SHIP_EMAIL>
          </OWD_ORDER_UPDATE_REQUEST>
        </OWD_API_REQUEST>
      XML
    end
  end
end
