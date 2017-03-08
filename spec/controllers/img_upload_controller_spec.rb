require 'rails_helper'

RSpec.describe ImgUploadController, type: :controller do

    before :each do
        @file = fixture_file_upload('files/test.jpg', 'images/jpg')
    end
    
    it "can upload a image" do
        file = Hash.new
        file[:file] = @file
        post :create, :upload => file
        response.should be_success
    end
    
end