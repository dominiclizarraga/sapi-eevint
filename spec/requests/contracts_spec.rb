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
        post contracts_path, params: { contract: contract_params }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "invalid parameters" do
      it "does not create a new contract" do
        invalid_params = FactoryBot.attributes_for(:contract, job_name: nil)
        post contracts_path, params: { contract: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /contracts/:id/edit" do
    it "should return a 200 response" do
      contract = FactoryBot.create(:contract)
      get edit_contract_path(contract)
      expect(response).to have_http_status "200"
    end
  end
end
