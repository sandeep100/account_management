class Account < ActiveRecord::Base
  DEFAULT_ACCOUNTS = [:bank, :cash, :expense]

  def self.default_accounts
    DEFAULT_ACCOUNTS
  end
end
