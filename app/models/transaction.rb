class Transaction < ActiveRecord::Base
  has_many :postings

  validates :transaction_date, presence: true
  validates :comment, presence: true

  def create_transaction_amount(id)
  	transaction = Transaction.find_by_id(id)
      if transaction.present?
        posting = Posting.where(transaction_id: "#{id}")
        transaction.amount =  posting.sum(:amount).to_f
        transaction.save
    end
  end
end
