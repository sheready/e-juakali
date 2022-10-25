require 'rails_helper'

RSpec.describe "Vendors", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/vendors/index"
      expect(response).to have_http_status(:success)
    end
  end

end
