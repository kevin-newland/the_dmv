class FacilityFactory

    attr_reader :new_facilities

  def initialize(new_facilities = [])
    @new_facilities = new_facilities
  end


  def create_facilities(all_office_locations)
    all_office_locations.each do |facility|  
      facility = Facility.new(facility) 
      
      @new_facilities << facility
     
    end
    # binding.pry
  end
end