require_relative "../test_helper"
class TransactionsControllerTest < ActionController::TestCase
  fixtures :transactions
 # def setup
 #    @controller = TransactionsController.new
 #    @request    = ActionController::TestRequest.new
 #    @response   = ActionController::TestResponse.new
 #  end

  test "should get index" do
    get :index
    assert_response :success
  end


end