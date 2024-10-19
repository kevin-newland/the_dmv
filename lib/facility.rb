class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees
              

  def initialize(facilities_details)
    @name = facilities_details[:name]
    @address = facilities_details[:address]
    @phone = facilities_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    # binding.pry
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.set_registration_date
    true
  end

  def plate_type 
    if @vehicle.year > 25
      :antique
    elsif @vehicle.year == 12
      :regular
    elsif @vehicle.year == 5
      :ev

    end
  end
end
