require 'rails_helper'

describe User do
	let!(:user) { User.create(email:"stephen@gmail.com", password:"stephen") }
	
	context "email" do 
		it "should return valid email" do  
			expect(user.email).to eq("stephen@gmail.com")
		end
	end
end

