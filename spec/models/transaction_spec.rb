require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "Validation testing For Transaction model" do
    it { should validate_presence_of(:transaction_date) }
  end

  describe "Belongs to Validation" do
  	it { should have_many(:postings) }
  end
end
