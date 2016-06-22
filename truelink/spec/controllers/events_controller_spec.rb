require 'spec_helper'
 
describe EventsController do
	render_views

  describe "GET Index" do
  	before {@event = Event.create!(title: 'test', start_date: Date.parse('20-9-2016'), interval: 1, action_day: 10, buffer: 2)}
    it "gets the index view" do
      get "index"
      response.status.should be 200
    end
    it "gets the correct index view template" do
      get "index"
      response.should render_template("events/index")
    end
    it "should have the first action date on display" do
      get "index"
      response.body.should match(/2016-10-07/)
    end
  end

  describe "GET Show" do
  	before {@event = Event.create!(title: 'test', start_date: Date.parse('20-9-2016'), interval: 1, action_day: 10, buffer: 2)}
    it "gets the Show view" do
      get :show, id: @event
      response.status.should be 200
    end
    it "should skip bank holidays" do
      get :show, id: @event
      response.body.should match(/07 Oct/) #this takes into consideration a holiday and a weekend
    end
    it "should skip Sundays" do
      get :show, id: @event
      response.body.should_not match(/Sun/) #this takes into consideration a holiday and a weekend
    end
    it "should skip Saturdays" do
      get :show, id: @event
      response.body.should_not match(/Sat/) #this takes into consideration a holiday and a weekend
    end
  end

end