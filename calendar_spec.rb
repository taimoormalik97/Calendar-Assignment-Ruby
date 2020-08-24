
require_relative 'calendar'
require 'date'
describe Calendar do 
   context "When testing the Calendar class" do 
      before(:each) do 
     	@cal = Calendar.new 
      end
            
      it "All events in the start should be zero" do 
         expect(@cal.all_events.size).to eq 0
      end
      context "When testing theadd and delete functionality of calendar" do
         before(:each) do 
            @name = "12"
            @description = "12414"
            @date = Date.new(2020,12,12)
         end
         it "should add an event" do
            expect(@cal.all_events.size).to eq 0
            @cal.add_an_event(@name ,@description, @date)
            expect(@cal.all_events.size).to eq 1
            expect(@cal.all_events[@date].first.event_name).to eq @name
            expect(@cal.all_events[@date].first.description).to eq @description
         end
         it "should not add an event when name is nil" do
            expect(@cal.all_events.size).to eq 0
            @cal.add_an_event(nil ,@description, @date)
            expect(@cal.all_events.size).to eq 0
         end
         it "should not add an event when date is nil" do
            expect(@cal.all_events.size).to eq 0
            @cal.add_an_event(@name,@description, nil)
            expect(@cal.all_events.size).to eq 0
         end
          it "should delete an event" do
            expect(@cal.all_events.size).to eq 0
            @cal.add_an_event(@name ,@description, @date)
            expect(@cal.all_events.size).to eq 1
            @cal.delete_an_event(@name ,@date)
            expect(@cal.all_events.size).to eq 0
         end
          it "should not delete an event when an event when the given name is not found" do
            expect(@cal.all_events.size).to eq 0
            @cal.delete_an_event(@name , @date)
            expect(@cal.all_events.size).to eq 0
         end
         it "should not delete an event when an event when the given date is not found" do
            expect(@cal.all_events.size).to eq 0
            @cal.delete_an_event(@name , @date)
            expect(@cal.all_events.size).to eq 0
         end
         it "should not delete an event when name is nil" do
            expect(@cal.all_events.size).to eq 0
            @cal.delete_an_event(nil, @date)
            expect(@cal.all_events.size).to eq 0
         end
         it "should not delete an event when date is nil" do
            expect(@cal.all_events.size).to eq 0
            @cal.delete_an_event(@name, nil)
            expect(@cal.all_events.size).to eq 0
         end
      end 
       context "When testing the edit functionality of calendar" do
         before(:each) do 
            @name = "12"
            @description = "12414"
            @date = Date.new(2020,12,12)
            @new_name = "13"
            @new_date = Date.new(2021,05,19)
         end
          it "should edit an event" do
            expect(@cal.all_events.size).to eq 0
            @cal.add_an_event(@name ,@description, @date)
            expect(@cal.all_events.size).to eq 1
            expect(@cal.all_events[@date].first.event_name).to eq @name
            expect(@cal.all_events[@date].first.description).to eq @description
            @cal.update_an_event(@name , @date, @new_name , @new_date, @new_description)
            expect(@cal.all_events.size).to eq 1
            expect(@cal.all_events[@new_date].first.event_name).to eq @new_name
            expect(@cal.all_events[@new_date].first.description).to eq @new_description
         end
         it "should not edit an event when the given name is not found" do
            expect(@cal.all_events.size).to eq 0
            @cal.update_an_event(@name , @date, @new_name , @new_date, @new_description)
            expect(@cal.all_events.size).to eq 0
         end
         it "should not edit an event when the given date is not found" do
            expect(@cal.all_events.size).to eq 0
            @cal.update_an_event(@name , @date, @new_name , @new_date, @new_description)
            expect(@cal.all_events.size).to eq 0
         end
         it "should not edit an event when name is nil" do
            expect(@cal.all_events.size).to eq 0
            @cal.update_an_event(@name , @date, @new_name , @new_date, @new_description)
            expect(@cal.all_events.size).to eq 0
         end
         it "should not edit an event when date is nil" do
            expect(@cal.all_events.size).to eq 0
            @cal.update_an_event(@name , @date, @new_name , @new_date, @new_description)
            expect(@cal.all_events.size).to eq 0
         end
       end
   end
end
