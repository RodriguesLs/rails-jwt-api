require 'rails_helper'

RSpec.describe User do
  describe "#new" do
    let(:user) { described_class.new(username: 'any', password: 'any', age: 10) }
    
    context "with valid parameters should have success when" do
      it "receive all parameters" do
        expect(user).to be_valid
      end

      it "not receive age" do
        user.age = nil
        expect(user).to be_valid
      end
    end

    context "with invalid parameters should be invalid when" do
      let(:user_2) { described_class.new(username: '', password: 'any', age: 10) }

      it "haven't password" do
        user.password = nil
        expect(user).to_not be_valid
      end

      it "haven't username" do
        expect(user_2).to_not be_valid
      end
    end

    
  end
end