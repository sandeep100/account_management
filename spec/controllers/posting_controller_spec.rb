require 'rails_helper'
RSpec.describe PostingsController, type: :controller do
	describe "GET #new" do
		before do 
      @posting = FactoryGirl.build(:posting)
    end
    it "renders the new template" do
      get :new, format: :js
      expect(assigns(:posting))==(@posting)
    end
  end   
end
