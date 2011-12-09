require 'spec_helper'

describe "TrapSpeeds" do
  describe "GET /trap_speeds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get trap_speeds_path
      response.status.should be(200)
    end
  end
end
