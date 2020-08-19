require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_in" do
    it "should direct to sign in page" do
      get new_user_session_path
      expect(response.body).to include('Sign in')
    end
  end

  describe "GET /users/sign_up" do
    it "should direct to sign up page" do
      get new_user_registration_path
      expect(response.body).to include('Sign up')
    end
  end

  describe "POST /users/sign_in" do
    it "should direct to sign in page" do
      get user_session_path
      expect(response.body).to include('Sign in')
    end
  end
end
