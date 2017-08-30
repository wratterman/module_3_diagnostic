require 'rails_helper'

describe AltFuelService do
  describe "stations" do
    it "finds all 80203 stations" do
      VCR.use_cassette("services/find_denver_stations") do
        stations = AltFuelService.find_stations("80203")
        station = stations.first

        expect(stations.count).to eq(10)
        expect(station[:station_name]).to eq("UDR")
        expect(station[:city]).to eq("Denver")
      end
    end
  end
end
