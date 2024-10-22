class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees          
  attr_accessor :age
              
            
  def initialize(facilities_details)
    @name = facilities_details[:name] || facilities_details[:dmv_office] || facilities_details[:office_name] || facilities_details[:office_type]
    @address = facilities_details[:address] || facilities_details[:address_li] || facilities_details[:address_1] || facilities_details[:street_address_line_1]
    @phone = facilities_details[:phone] || facilities_details[:public_phone_number] || nil
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
    end
  end

  def administer_written_test(registrant)
    unless  @services.include?('Written Test')
      return false
    else
      if registrant.permit? && registrant.age >= 16
        registrant.license_data[:written] = true
        true
      else
        false
      end
    end
    #  binding.pry
  end

  def administer_road_test(registrant)
    unless  @services.include?('Road Test')
      return false
    else
      if registrant.permit? && registrant.age >= 16
        registrant.license_data[:written] = true
        registrant.license_data[:license] = true
        true
      else
        false
      end
    end
    #  binding.pry
  end

  def renew_drivers_license(registrant)
    unless  @services.include?('Renew License') 
      return false
    else
      if registrant.license_data[:license] = true 
        registrant.license_data[:written] = true 
        registrant.license_data[:license] = true 
        registrant.license_data[:renewed] = true
        true
      else
        false
      end
    end
    #  binding.pry
  end

end
