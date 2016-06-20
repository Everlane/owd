require 'owd/documents/order_release'
require "test_helper"

describe OWD::OrderRelease do
  before do
    @doc = OWD::OrderRelease.new
  end

  describe "#owd_name" do
    it { assert_equal @doc.owd_name, 'OWD_ORDER_RELEASE_REQUEST' }
  end

  describe "#build" do
    it "builds an XML body with an :order_reference" do
      assert_equal_xml @doc.build(order_reference: '123'), <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <OWD_API_REQUEST>
          <OWD_ORDER_RELEASE_REQUEST clientOrderId="123" />
        </OWD_API_REQUEST>
      XML
    end
  end
end
