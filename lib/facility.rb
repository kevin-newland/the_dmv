class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees          
  attr_accessor :age
              
              

  def initialize(facilities_details)
    @name = facilities_details[:name]
    @address = facilities_details[:address]
    @phone = facilities_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @age = age
  end

  def add_service(service)
    @services << service
  end

  
  def register_vehicle(vehicle)
    unless  @services.include?('Vehicle Registration')
      return nil
    else
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
        vehicle.registration_date = Date.today
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
        vehicle.registration_date = Date.today
      else  
        vehicle.plate_type = :regular
        @collected_fees += 100
        vehicle.registration_date = Date.today
      end
      @registered_vehicles << vehicle
      # binding.pry
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? && @registrant.age >= 16
      true
    else
      false
    end
    
  end

end
