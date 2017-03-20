require 'rails_helper'

describe PointsController do
    describe 'signing in to meeting' do
        it 'should add user to roster and give them points' do
            expect {
                post :meeting_signin
            }.not_to raise_error
        end
    end
end

RSpec.describe PointsController, type: :controller do

end
