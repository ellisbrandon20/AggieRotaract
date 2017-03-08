require 'rails_helper'

describe EventsController do
    describe 'pulling Events' do
        it 'should select non-meeting events that have not occured and display them' do
             expect { 
                get :index 
             }.not_to raise_error
        end
    end
end

RSpec.describe EventsController, type: :controller do
    it 'Event should be created' do
        expect { 
            get :create, :event => {:event => :attributes }
        }.to change { Event.count }
    end
end