require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'pry'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  
  describe '#initialize' do
    it 'can initialize' do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory).to be_an_instance_of(VehicleFactory)
      expect(@factory.new_vehicles).to be_a(Array)
    end
  end

  describe 'create_vehicles' do
    it 'can create vehicles' do #ruby docs find different method that pulls random
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.new_vehicles.shuffle.first.vin).to be_a(String)
      expect(@factory.new_vehicles.shuffle.first.year).to be_a(String)
      expect(@factory.new_vehicles.shuffle.first.make).to be_a(String)
      expect(@factory.new_vehicles.shuffle.first.model).to be_a(String)
      expect(@factory.new_vehicles.shuffle.first.engine).to be(:ev)
      expect(@factory.new_vehicles.shuffle.first.registration_date).to be(nil)
      expect(@factory.new_vehicles.shuffle.first.plate_type).to be(:ev)
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a(Array)
    end
  end

end
