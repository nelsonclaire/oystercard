require 'station.rb'

describe Station do

    before(:all) do
        @station = Station.new(name = "Victoria", zone = 1)
      end

  describe "#station" do

    it "returns station name" do
      expect(@station.name).to eq("Victoria")
    end

    it "returns station zone" do
      expect(@station.zone).to eq(1)
    end

  end 
end
