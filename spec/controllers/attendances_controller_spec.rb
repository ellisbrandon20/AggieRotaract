require 'rails_helper'

RSpec.describe AttendancesController, type: :controller do
    before do
        @uin=456789123
        @id=1
        @car=false
        @comment="poop"
        @cont="call"
        @att=Attendance.create(@uin,@id,@car,@comment,@cont)
        @att.save
    end
    describe "create" do
        context "Signup for event" do
            it "creates an attendance record with correct user" do
                expect (@att.user)==@uin
            end
        end
    end
end
