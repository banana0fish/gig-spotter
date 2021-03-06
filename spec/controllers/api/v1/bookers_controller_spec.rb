require 'rails_helper'

RSpec.describe Api::V1::BookersController, type: :controller do
  describe 'a' do
    let!(:user) {User.create(first_name: "Richard", last_name: "Smith", email: "RSmith@gmail.com", password: "password123", password_confirmation: "password123", birthday: Date.new(1995,2,3))}

    before(:each) do
      allow(controller).to receive(:current_user).and_return(user)

      Booker.create(organization_name: "Very helpful!", booker_bio: "Booking shows makes me happy", booker_image: "https://www.ccreadingfarm.com/wp-content/uploads/doggy-day.jpg")

    end

    describe "GET#index" do
      it "should return a list of all the bookers" do
        get :index
        returned_json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(response.content_type).to eq "application/json"
        expect(returned_json.length).to eq 1
        expect(returned_json["bookers"][0]["organization_name"]).to eq "Very helpful!"
      end
    end


  end
end
