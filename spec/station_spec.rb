require 'station.rb'

describe Station do

  let(:name) { "Victoria "}
  let(:zone) { 1 }
  let(:station) { Station.new(name, zone) } 

  describe "#station" do

    it "returns station name" do
      expect(station.name).to eq name
    end

    it "returns station zone" do
      expect(station.zone).to eq zone
    end

  end 
end
