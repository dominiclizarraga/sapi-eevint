require 'rails_helper'

RSpec.describe "Contracts", type: :request do
  describe "GET/contracts" do
    it "should return a 200 response" do
      get contracts_path
      expect(response).to have_http_status "200"
    end
  end

  describe "GET/contracts/:id" do
    it "should return a 200 response" do
      contract = FactoryBot.create(:contract)
      get contract_path(contract.id)
      expect(response).to have_http_status "200"
    end
  end
end