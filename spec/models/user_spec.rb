require 'rails_helper'

describe User do
	let!(:user) { User.create(email:"stephen@gmail.com", password:"stephen") }
	
	context "email" do 
		it "should return valid email" do  
			expect(user.email).to eq("stephen@gmail.com")
		end
	end
	context "password" do 
		it "should return the password" do 
			expect(user.password).to eq("stephen")
		end
	end

	
	context "validates unique email" do 
		it { should validate_uniqueness_of(:email) }
	end

	context "validates presence of email" do 
		it { should validate_presence_of(:email) }
	end

	context "validates presence of password" do 
		it { should validate_presence_of(:password) }
	end

	context "validates has_secure_password" do 
		it { should have_secure_password }
	end
end

