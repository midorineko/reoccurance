require 'spec_helper'
 
describe EventsController do
  describe "GET Index" do
    it "gets the index view" do
      get "index"
      response.status.should be 200
    end
 
    it "gets the correct index view template" do
      get "index"
      response.should render_template("events/index")
    end
  end

  describe "GET Show" do
  	before {@event = Event.create!(title: 'test', start_date: Date.parse('20-9-2016'), interval: 1, action_day: 10)}
    it "gets the Show view" do
      get :show, id: @event
      response.status.should be 200
    end
  end


end