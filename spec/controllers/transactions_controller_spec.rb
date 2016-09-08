require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe "GET #new" do
		before do 
      @transaction = FactoryGirl.build(:transaction)
    end
    it "renders the new template" do
      get :new, format: :js
      expect(assigns(:transaction))==(@transaction)
    end
  end  

  describe "GET #create" do
    it "renders the createtemplate" do
      expect{post :create, transaction: FactoryGirl.attributes_for(:transaction), postings: [FactoryGirl.attributes_for(:posting)]}.to change(Transaction, :count).by(1)
    end
  end    
end
