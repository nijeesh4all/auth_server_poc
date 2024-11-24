require "rails_helper"

RSpec.describe "User Sessions", type: :request do
  let!(:user) { create(:user) }

  describe "GET /users/sign_in" do
    it "renders the sign in form" do
      get new_user_session_path
      expect(response).to render_template(:new)
    end

    context "when user is already signed in" do

      before do
        sign_in(user)
      end

      it "redirects to root path" do
        get new_user_session_path
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST /users/sign_in" do
    it "signs in a user" do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect(response).to redirect_to(root_path)
    end

    it "does not sign in a user with invalid credentials" do
      post user_session_path, params: { user: { email: user.email, password: "wrongpassword" } }
      expect(response).to render_template(:new)
      expect(response.body).to include("Invalid Email or password.")
    end
  end

  describe "DELETE /users/sign_out" do
    it "signs out a user" do
      sign_in(user)
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end
  end

end
