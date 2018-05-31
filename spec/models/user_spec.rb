require 'rails_helper'

RSpec.describe User, type: :model do

	context "validations" do
 	
 	# happy_path
    describe "can be created when all attributes are present" do
      When(:user) { User.create(
        username: "User",
        email: "user@example.com",
        password: "1234",
       
      )}
      Then { user.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a name" do
      When(:user) { User.create(email: "user@example.com", password: "1234") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:user) { User.create(username: "User", password: "1234") }
      Then { user.valid? == false }
    end


    #association
    
	it "should have many authentications" do
        auth = User.reflect_on_association(:authentications)
        expect(auth.macro).to eq(:has_many)
     end
    
end
end