require 'rails_helper'

RSpec.describe Task, type: :model do

	context "validations" do
 	
 	# happy_path
    describe "can be created when task and detail are present" do
      When(:user) { User.create(
        username: "User",
        email: "user@example.com",
        password: "1234",
       
      )}
      When(:task) { Task.create(
        task: "Lunch",
        detail: "Must eat",
        user_id: user.id
       
      )}

      Then { 

        task.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a task" do
      When(:task) { Task.create(detail: "Must eat") }
      Then { task.valid? == false }
    end

    describe "cannot be created without a detail" do
      When(:task) { Task.create(task: "Lunch") }
      Then { task.valid? == false }
    end
  end
    
    context "associations" do
    it { is_expected.to belong_to(:user) }
  end 

end