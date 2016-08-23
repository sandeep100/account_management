class Posting < ActiveRecord::Base
  belongs_to :account
  belongs_to :transaction

  validates :account_id, presence: true
  validates :amount, numericality: true
end
