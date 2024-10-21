class VehicleFactory
   attr_reader :new_vehicles

  def initialize
    @new_vehicles = []
   
  end
  def create_vehicles(wa_ev_registrations)
    wa_ev_registrations.each do |vehicle|  
      vehicle = Vehicle.new(vehicle) 
      
      @new_vehicles << vehicle  #Shovels the vehicles that are created into the new array
      
      
    end
    
  end
  
end