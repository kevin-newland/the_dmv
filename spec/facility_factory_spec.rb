require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_factory'
require 'pry'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end
  
  describe '#initialize' do
    it 'can initialize' do
      @factory.create_facilities(@co_dmv_office_locations)
      expect(@factory).to be_an_instance_of(FacilityFactory)
      expect(@factory.new_facilities).to be_a(Array)
    end
  end

  describe 'create_facilities' do
    it 'can create facilities' do 
      @factory.create_facilities(@co_dmv_office_locations)
      expect(@factory.new_facilities.shuffle.first.name).to be_a(String)
      expect(@factory.new_facilities.shuffle.first.full_address).to be_a(String)
      # expect(@factory.new_facilities.shuffle.first.make).to be_a(String)
      # expect(@factory.new_acilities.shuffle.first.model).to be_a(String)
      # expect(@factory.nefw_facilities.shuffle.first.engine).to be_a(String)
      # expect(@factory.new_facilities.shuffle.first.registration_date).to be_a(String)
      # expect(@factory.new_facilities.shuffle.first.plate_type).to be_a(String)
      expect(@factory.create_facilities(@co_dmv_office_locations)).to be_a(Array)
    end
  end
end