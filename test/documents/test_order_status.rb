require './lib/owd/documents/order_status'
require "./test/test_helper"

describe OWD::OrderStatus do
  include XmlAssertions

  before do
    @doc = OWD::OrderStatus.new
  end

  describe "#owd_name" do
    it { assert_equal @doc.owd_name, 'OWD_ORDER_STATUS_REQUEST' }
  end

  describe "#build" do
    it "builds an XML request document" do
      assert_equal_xml @doc.build, <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <OWD_API_REQUEST>
          <OWD_ORDER_STATUS_REQUEST clientOrderId="" />
        </OWD_API_REQUEST>
      XML
    end
  end
end
