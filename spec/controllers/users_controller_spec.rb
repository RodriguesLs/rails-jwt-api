require 'rails_helper'

RSpec.describe UsersController do
  describe "#create" do
    context "with valid params" do
      it "should be succes" do
        post :create, params: { username: 'liar', password: 'liar', age: 19 }
        
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "should be render error message" do
        post :create, params: { username: nil, password: 'lies' }

        json = JSON.parse(response.body)
        
        expect(response).to have_http_status(400)
        expect(json.keys).to contain_exactly('error')
        expect(json['error']).to eq 'Invalid username or password'
      end
    end
  end
end