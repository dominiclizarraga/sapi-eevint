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

  describe "contracts/create" do
    context "valid parameters" do
      it "should create a new contract" do
        contract_params = FactoryBot.attributes_for(:contract)
        post contracts_path, params: { contract: contract_params }
        # debugger
        expect(response).to have_http_status "200"
      end
    end

    context "invalid parameters" do
      it "does not create a new contract" do
      end
    end
  end


end