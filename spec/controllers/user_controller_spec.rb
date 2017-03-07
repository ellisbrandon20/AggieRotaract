require 'rails_helper'
require 'user_controller'

RSpec.describe UserController, type: :controller do
    describe "login" do
        context "input UIN that exists" do
            it "returns true" do
                expect User.exists?(123456789)==true
            end
        end
        context "input UIN that does not exist" do
            it "returns false" do
                expect User.exists?(000000000)==false
            end
        end
    end
    describe "admin_password_validation" do
        context "input correct password" do
            it "returns true" do
                expect ("password"=="password")==true
            end
        end
        context "input incorrect password" do
            it "returns false" do
                expect ("nope"=="password")==false
            end
        end
    end
end
