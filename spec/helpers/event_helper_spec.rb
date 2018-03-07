require 'rails_helper'

RSpec.describe EventHelper, :type => :helper do
  describe "#read?(user, event)" do
  	context 'when there is user and user read the event' do
  		it "should return true" do
			  user = User.create!(:name => "John", :email => "dhoang@gmail.com", :password => "1234567")
			  event = Event.create!(:title => "As Gunman Rampaged Through Florida School, Armed Deputy ‘Never Went In’")
			  Reading.create!(:user_id => user.id, :event_id => event.id)
			  expect(helper.read?(user, event)).to eq(true)
			end
  	end

  	context 'when user does not read the event' do
  		it 'should return false' do
  			user = User.create!(:name => "John", :email => "dhoang@gmail.com", :password => "1234567")
			  event = Event.create!(:title => "As Gunman Rampaged Through Florida School, Armed Deputy ‘Never Went In’")
			  expect(helper.read?(user, event)).to eq(false)
  		end
  	end
  	
  	context 'when value of user_id is nil' do
  		it 'should return false' do
  			user = nil
  			event = Event.create!(:title => "As Gunman Rampaged Through Florida School, Armed Deputy ‘Never Went In’")
  			expect(helper.read?(user, event)).to eq(false)
  		end
  	end	
	end
end

RSpec.describe EventHelper, :type => :helper do
  describe "#read_event_class(user, event)" do
  	it "should if condition return true" do
		  user = User.create!(:name => "John", :email => "dhoang@gmail.com", :password => "1234567")
		  event = Event.create!(:title => "As Gunman Rampaged Through Florida School, Armed Deputy ‘Never Went In’")
		 	Reading.create!(:user_id => user.id, :event_id => event.id)
		  expect(helper.read?(user, event)).to eq(true)
		  expect(helper.read_event_class(user, event)).to eq("darker_event")
		end
	end
end