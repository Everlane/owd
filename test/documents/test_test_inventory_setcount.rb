require 'owd/documents/test_inventory_setcount'
require 'test_helper'

describe OWD::TestInventorySetcount do
  before do
    @doc = OWD::TestInventorySetcount.new
  end

  describe "#owd_name" do
    it { assert_equal @doc.owd_name, 'OWD_TEST_INVENTORY_SETCOUNT_REQUEST' }
  end

  describe "#build" do
    it "builds an XML request document" do
      assert_equal_xml @doc.build, <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <OWD_API_REQUEST>
          <OWD_TEST_INVENTORY_SETCOUNT_REQUEST/>
        </OWD_API_REQUEST>
      XML
    end
  end
end
