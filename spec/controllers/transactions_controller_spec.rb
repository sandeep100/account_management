require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
  end
end
