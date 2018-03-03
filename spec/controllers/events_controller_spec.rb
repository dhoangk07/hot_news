require 'rails_helper'

RSpec.describe EventsController do
  describe "GET index" do
    it "assigns @events" do
      event = Event.create
      get :index
      expect(assigns(:events)).to eq([event])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders with params tag event" do
      event = Event.create
      tag = Tag.create(name: "sport")
      event.tags << tag

      event_2 = Event.create


      
      get :index, params: { :tag => "sport" } 
      expect(assigns(:events)).to eq([event])
    end
  end
end