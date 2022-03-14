require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should only create user with valid passwords" do
      @user = User.create(first_name: "Matt", last_name: "Campbell", email: "Matt@porsche.com", password: "test", password_confirmation: "test")
      expect(@user).to be_valid
    end

    it "should NOT work if passwords are different" do 
      @user = User.new(first_name: "Matt", last_name: "Campbell", email: "Matt@porsche.com", password: "test", password_confirmation: "fail")
      expect(@user).not_to be_valid
    end

    it "cannot have password with less than 3 characters" do 
      @user = User.new(first_name: "Matt", last_name: "Campbell", email: "Matt@porsche.com", password: "yo", password_confirmation: "yo")
      expect(@user).not_to be_valid
    end
    

    it "cannot have duplicate emails" do
      @user = User.create(first_name: "Matt", last_name: "Campbell", email: "Matt@porsche.com", password: "test", password_confirmation: "test")
      @user2 = User.create(first_name: "Dennis", last_name: "Olsen", email: "Matt@porsche.com", password: "test", password_confirmation: "test")
      expect(@user2).not_to be_valid
    end

    it "cannot have duplicate emails even with case differential" do
      @user = User.create(first_name: "Matt", last_name: "Campbell", email: "Matt@porsche.com", password: "test", password_confirmation: "test")
      @user2 = User.create(first_name: "Dennis", last_name: "Olsen", email: "MATT@PORSCHE.COM", password: "test", password_confirmation: "test")
      expect(@user2).not_to be_valid
    end


    it "should have first name, last name and email" do
      @user = User.new(first_name: nil, last_name: nil, email: nil, password: "test", password_confirmation: "test")
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return user with proper credentials" do
      @user = User.create(first_name: "Matt", last_name: "Campbell", email: "matt@porsche.com", password: "test", password_confirmation: "test")
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to eql(@user);
    end

    it "should return nil if authentication fails" do
      @user = User.create(first_name: "Matt", last_name: "Campbell", email: "matt@porsche.com", password: "test", password_confirmation: "test")
      expect(@user.authenticate_with_credentials(@user.email, "wrong password")).to be_nil;
    end

    it "should return user if email has leading and/or trailing spaces" do
      @user = User.create(first_name: "Matt", last_name: "Campbell", email: "matt@porsche.com", password: "test", password_confirmation: "test")
      expect(@user.authenticate_with_credentials("  Matt@porsche.com   ", "test")).to eql(@user);
    end

    it "should return user if email mixed casing" do
      @user = User.create(first_name: "Matt", last_name: "Campbell", email: "matt@porsche.com", password: "test", password_confirmation: "test")
      expect(@user.authenticate_with_credentials("  matt@pOrsche.com   ", "test")).to eql(@user);
    end
  end
end
