require 'rails_helper'

RSpec.describe "Injectors", type: :request do
  describe "GET /injectors" do
    it "works! (now write some real specs)" do
      get injectors_path
      expect(response).to have_http_status(200)
    end
  end
end
