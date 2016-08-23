require 'rails_helper'

RSpec.describe Posting, type: :model do
  describe "Validation testing For Posting model" do
    it { should validate_presence_of(:account_id) }
    it { should validate_numericality_of(:amount) }
  end

  describe "Belongs to Validation" do
  	it { should belong_to(:account) }
  	it { should belong_to(:transaction) }
  end
end
