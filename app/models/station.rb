class Station

  attr_reader :name, :address, :fuel_type, :open_hours

  def initialize(station)
    @name = station[:station_name]
    @address = station[:street_address]
    @fuel_type = station[:fuel_type_code]
    @open_hours = station[:access_days_time]
  end

  def self.find_all(zipcode)
    station_info = AltFuelService.find_stations(zipcode)
    station_info.map do |station|
      new(station)
    end
  end
end
