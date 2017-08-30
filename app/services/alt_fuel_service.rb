class AltFuelService
  def initialize(zip)
    @zip  = zip
    @base = "https://developer.nrel.gov/api/alt-fuel-stations/v1.json"
  end

  def self.find_stations(zipcode)
    new(zipcode).find_my_stations
  end

  def find_my_stations
    get_url("?zip=#{zip}")
  end

  def get_url(url)
    request = base + url + "&api_key=#{ENV['ATS_KEY']}"
    response = Faraday.get(request)
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  private

  attr_reader :zip, :base
end
