require_relative "../test_helper"
class PostingTest < ActiveSupport::TestCase
  fixtures :postings

  def test_post
    first_posting = Posting.new :account_id => postings(:one_post).account_id,
                                       :transaction_id => postings(:one_post).transaction_id,
                                       :amount => postings(:one_post).amount

    assert first_posting.valid?
    assert_equal 1000, first_posting.amount, "Posting amount didn't equal"
    assert first_posting.save
    first_posting = Posting.find(first_posting.id)
    first_posting.amount = 100
    assert first_posting.save
    assert first_posting.destroy
  end
  
end