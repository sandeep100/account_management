class Transaction < ActiveRecord::Base
  has_many :postings

  validates :transaction_date, presence: true
  validates :comment, presence: true
end
