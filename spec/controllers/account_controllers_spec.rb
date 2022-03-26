require  'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe "PUT deposit" do
    
    let(:account) { create(:account) }
    before(:each) do
      put :deposit, params: { account_number: account.account_number, value: 100 }
    end
    
    it "returns a successful response" do
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT take_out" do
    
    let(:valid_account) { create(:account, balance: 150.0) }
    let(:invalid_account) { create(:account, balance: 50.0) }
    
    it "returns a successful response" do
      put :take_out, params: { account_number: valid_account.account_number, value: 100 }
      
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
 
    it "returns a error response" do
      put :take_out, params: { account_number: invalid_account.account_number, value: 100 }
      
      expect(response.body).to eq("{\"errors\":{\"balance\":[\"Account is not can't be has negative\"]}}")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT transfer" do
    
    let(:valid_account) { create(:account, balance: 150.0) }
    let(:invalid_account) { create(:account, balance: 50.0) }
    let(:destinity_account) {create(:account)}
    
    it "returns a successful response" do
      put :transfer, params: { account_number: valid_account.account_number,
        destinity_account_number: destinity_account.account_number, value: 100 }
      
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
 
    it "returns a error response" do
      put :transfer, params: { account_number: invalid_account.account_number,
        destinity_account_number: destinity_account.account_number, value: 100 }
      
      expect(response.body).to eq("{\"errors\":{\"balance\":[\"Account is not can't be has negative\"]}}")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end