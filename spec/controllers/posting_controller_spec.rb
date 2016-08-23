require 'rails_helper'

RSpec.describe PostingsController, type: :controller do
    it "renders the new template" do
      get :new, :format => 'js'
  end
end
