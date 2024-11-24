require "rails_helper"

RSpec.describe "OAuth Authorization", type: :request do
  let!(:user) { create(:user) }
  let!(:application) { create(:application) }

  let!(:code_challenge) { SecureRandom.hex }
  let!(:code_verifier) { code_challenge }
  let!(:code_challenge_method) { "s256" }



  let(:authorization_url) do
    oauth_authorization_path(
            client_id: application.uid, 
            redirect_uri: application.redirect_uri, 
            response_type: "code",
            code_challenge: code_verifier,
            code_challenge_method: code_challenge_method
          )
  end

  describe "GET /oauth/authorize" do
      it "redirects to login page" do
        get authorization_url
        expect(response).to redirect_to(new_user_session_path)
      end

      context "when user is already logged in" do
        before do
          sign_in(user)
        end

        it "redirects to application.redirect_uri" do
          get authorization_url
          grant = Doorkeeper::AccessGrant.last
          redirect_uri = URI::HTTPS.build(host: 'example.com', query: {code: grant.token}.to_query).to_s
          expect(response).to redirect_to(redirect_uri)
        end

        it 'creates an authorization grant' do
          expect do
            get authorization_url
          end.to change { Doorkeeper::AccessGrant.count }.by(1)
        end

        it 'has code in the redirect_uri' do
          get authorization_url
          expect(response.location).to include("code=")
        end
      end
  end
end
