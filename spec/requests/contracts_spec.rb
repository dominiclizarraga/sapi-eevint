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

  describe "POST /contracts" do
    context "valid parameters" do
      it "creates a new contract" do
        contract_params = FactoryBot.attributes_for(:contract)
        debugger
        expect {
          post "/contracts", params: { contract: contract_params }
        }.to change(Contract, :count).by(1)
        
        expect(response).to have_http_status(:created)
        expect(response.body).not_to include("Validation error message")
      end
    end

    context "invalid parameters" do
      it "does not create a new contract" do
        # invalid_params = FactoryBot.attributes_for(:contract, :invalid)
        
        # expect {
        #   post "/contracts", params: { contract: invalid_params }
        # }.not_to change(Contract, :count)
        
        # expect(response).to have_http_status(:unprocessable_entity)
        # expect(response.body).to include("Validation error message")
      end
    end
  end
end
