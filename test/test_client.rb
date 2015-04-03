require "./test/test_helper"

describe OWD::Client do
  before do
    @client = OWD::Client.new(client_id: 123, client_authorization: 'abc')
  end

  it 'gives acess to order_status' do
    mock_order_status = MiniTest::Mock.new
    mock_order_status.expect(:build, '', [{foo: 'bar'}])

    OWD::OrderStatus.stub :new, mock_order_status do
      begin
        @client.api.order_status(foo: 'bar')
      rescue OWD::APIError
      end
    end

    mock_order_status.verify
  end
end
