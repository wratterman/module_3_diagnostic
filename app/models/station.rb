class Station

  attr_reader :name, :address, :fuel_type, :open_hours

  def initialize(station)
    @name = station[:station_name]
    @address = station[:street_address]
    @fuel_type = fuel_display(station[:fuel_type_code])
    @open_hours = show_hours(station[:access_days_time])
  end

  def self.find_all(zipcode)
    station_info = AltFuelService.find_stations(zipcode)
    station_info.map do |station|
      new(station)
    end
  end

  private

  def fuel_display(code)
    if code == "ELEC"
      return "Electric"
    elsif code == "PROP"
      return "Propane"
    else
      code
    end
  end

  def show_hours(hours)
    substitute_days(hours)
    hours.split(";")
  end

  def substitute_days(hours)
    hours.gsub!("MO", "Monday")
    hours.gsub!("TU", "Tuesday")
    hours.gsub!("WE", "Wednesday")
    hours.gsub!("TH", "Thursday")
    hours.gsub!("FR", "Friday")
    hours.gsub!("SA", "Saturday")
    hours.gsub!("SU", "Sunday")
  end
end
