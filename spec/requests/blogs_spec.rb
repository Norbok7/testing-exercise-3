require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /index" do
    it 'returns a success response and all blogs' do
      blogs = FactoryBot.create_list(:blog, 3)
      get "/blogs"
      expect(response).to be_successful
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end
