require 'rails_helper'

RSpec.describe "Elevators", type: :request do

  before do
    user = FactoryBot.create(:user)
    # user.confirm # if you are using the confirmable module
    sign_in user
  end
  
  describe "GET /contracts/:contract_id/elevators" do
    it "should return a 200 response" do
      contract = FactoryBot.create(:contract)
      get contract_elevators_path(contract)
      expect(response).to have_http_status "200"
    end
  end

  describe "GET /contracts/:contract_id/elevators/:id" do
    it "should return a 200 response" do
      contract = FactoryBot.create(:contract)
      elevator = FactoryBot.create(:elevator, contract: contract)
      get contract_elevator_path(contract, elevator)
      expect(response).to have_http_status "200"
    end
  end

  describe "POST /contracts/:contract_id/elevators" do
    context "valid parameters" do
      it "creates a new elevator" do
        contract = FactoryBot.create(:contract)
        elevator_params = FactoryBot.attributes_for(:elevator)
        post contract_elevators_path(contract), params: { elevator: elevator_params }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "invalid parameters" do
      it "does not create a new elevator" do
        contract = FactoryBot.create(:contract)
        invalid_params = FactoryBot.attributes_for(:elevator, description: nil)
        post contract_elevators_path(contract), params: { elevator: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /contracts/:contract_id/elevators/:id/edit" do
    it "should return a 200 response" do
      contract = FactoryBot.create(:contract)
      elevator = FactoryBot.create(:elevator, contract: contract)
      get edit_contract_elevator_path(contract, elevator)
      expect(response).to have_http_status "200"
    end
  end

  describe "PATCH /contracts/:contract_id/elevators/:id" do
    context "valid parameters" do
      it "updates the elevator and redirects to the show page" do
        contract = FactoryBot.create(:contract)
        elevator = FactoryBot.create(:elevator, contract: contract)
        updated_params = FactoryBot.attributes_for(:elevator, description: "Updated Description")
    
        patch contract_elevator_path(contract, elevator), params: { elevator: updated_params }
        expect(response).to redirect_to(contract_elevator_path(contract, elevator))
      end
    end

    context "invalid parameters" do
      it "does not update the elevator and returns unprocessable entity" do
        contract = FactoryBot.create(:contract)
        elevator = FactoryBot.create(:elevator, contract: contract)
        invalid_params = FactoryBot.attributes_for(:elevator, description: nil)

        patch contract_elevator_path(contract, elevator), params: { elevator: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)

        elevator.reload
        expect(elevator.description).not_to be_nil
      end
    end
  end

  describe "DESTROY /contracts/:contract_id/elevators/:id" do
    it "should delete an elevator" do
      contract = FactoryBot.create(:contract)
      elevator = FactoryBot.create(:elevator, contract: contract)

      expect {
        delete contract_elevator_path(contract, elevator)
      }.to change(Elevator, :count).by(-1)

      expect(response).to redirect_to(contract_elevators_path(contract))
    end
  end
end
