require_relative "../test_helper"
class TransactionTest < ActiveSupport::TestCase
  fixtures :transactions

  def test_transaction
    first_transaction = Transaction.new :transaction_date => transactions(:one_trans).transaction_date,
                                       :comment => transactions(:one_trans).comment,
                                       :amount => transactions(:one_trans).amount

    assert first_transaction.valid?
    assert_equal "this is first comment for test", first_transaction.comment, "transaction comment didn't match"

    assert first_transaction.save
    first_transaction = Transaction.find(first_transaction.id)
    first_transaction.amount = 100
    assert first_transaction.save
    assert first_transaction.destroy
  end

end