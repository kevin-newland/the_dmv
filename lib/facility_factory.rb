class FacilityFactory

    attr_reader :new_facilities

  def initialize(new_facilities = [])
    @new_facilities = []
  end


  def create_facilities(co_dmv_office_locations)
    co_dmv_office_locations.each do |facility|  
      @facility = FacilityFactory.new(facility) 
      
      @new_facilities << facility
      binding.pry
    end
  end
end