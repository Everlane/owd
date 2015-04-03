require "./test/test_helper"

describe OWD::Client do
  before do
    @client = OWD::Client.new(client_id: 123, client_authorization: 'abc')
  end

  it 'gives acess to order_status' do
    mock_order_status = MiniTest::Mock.new
    mock_order_status.expect(:build, '', [{foo: 'bar'}])

    mock_request = MiniTest::Mock.new
    mock_request.expect(:perform, true)

    OWD::OrderStatus.stub :new, mock_order_status do
      OWD::Request.stub :new, mock_request do
        @client.api.order_status(foo: 'bar')
      end
    end

    mock_order_status.verify
    mock_request.verify
  end
end
