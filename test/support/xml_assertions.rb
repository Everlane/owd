require 'crack'

module XmlAssertions
  def assert_equal_xml(actual, expected)
    assert_equal Crack::XML.parse(actual),
      Crack::XML.parse(expected)
  end
end
