require 'spec_helper'
require 'pry'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#Vehicle Registration' do
    before(:each) do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @today = Date.today
    end

    it "initialize set up" do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@camaro).to be_an_instance_of(Vehicle)
    end

    it 'can add services to facility' do 
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to include('Vehicle Registration')
    end

    it 'can start not registered with zero collected fees' do
      @facility_1.add_service('Vehicle Registration')

      expect(@cruz.registration_date).to be(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'can register vehicle @cruz' do 
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'can register vehicle @camaro ' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      #  binding.pry
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
      expect(@camaro.plate_type).to eq(:antique)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@facility_1.collected_fees).to eq(125)
    end

    it 'can register vehicle @bolt' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt) 

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.plate_type).to eq(:ev)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@facility_1.collected_fees).to eq(325)
    end
  
    it '#facility_2 cant register vehicles' do
    
     expect(@facility_2.registered_vehicles).to eq([])
     expect(@facility_2.services).to eq([])
     expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
     expect(@facility_2.collected_fees).to eq(0)
     end
   #hint boolean logic(written test) 
  end
   


  describe '#Getting a Drivers License' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

    it '#initialize set up' do
      expect( @registrant_1).to be_an_instance_of(Registrant)
      expect( @registrant_2).to be_an_instance_of(Registrant)
      expect( @registrant_3).to be_an_instance_of(Registrant)
      expect( @facility_1).to be_an_instance_of(Facility)
      expect( @facility_2).to be_an_instance_of(Facility)
    end
    

    describe '#Administer a written test' do

      it 'starting expectations' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be(true)
        expect(@facility_1.administer_written_test(@registrant_1)).to be false
      end

      xit 'add_service for registrant_1' do
        @facility_1.add_service('Written Test')
        expect(@facility_1.administer_written_test(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      xit 'checks age' do
        @registrant_2.age
        expect(@registrant_2.age).to eq(16)
      end

      xit 'checks for permit' do
        @registrant_2.permit?
        expect(@registrant_2.permit?).to be(false)
        expect(@facility_1.administer_written_test(@registrant_2)).to be false
      end

      xit 'add_service for registrant_2' do
        @registrant_2.earn_permit
        @facility_1.add_service('Written Test')
        expect(@facility_1.administer_written_test(@registrant_2)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      xit 'checks age' do
        @registrant_3.age
        expect(@registrant_3.age).to eq(15)
      end

      xit 'checks for permit' do
        @registrant_3.permit?
        expect(@registrant_3.permit?).to be(false)
        expect(@facility_1.administer_written_test(@registrant_3)).to be false
      end

      xit 'does not add_service for registrant_3' do
        # @registrant_3.earn_permit
        
        expect(@facility_1.administer_written_test(@registrant_3)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end

    describe '#Administer a road test' do
      xit 'starting expectations' do
        expect(@facility_1.administer_road_test(@registrant_3)).to be false
        expect( @registrant_3.permit?).to be(false)
        expect( @registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      xit 'add_service road test for registrant_1' do
        @facility_1.add_service('Road Test')
        expect(@facility_1.administer_road_test(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end

      xit 'add_service road test for registrant_2' do
        @facility_1.add_service('Road Test')
        expect(@facility_1.administer_road_test(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end
    end

    describe 'Renew a drivers license' do
      xit 'starting expectations' do
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be false
      end

      xit 'add_service Renew License for registrant_1' do 
        @facility_1.add_service('Renew License')
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end

      xit 'can not add_service Renew License for registrant_3' do
        expect(@facility_1.renew_drivers_license(@registrant_3)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      xit 'add_service Renew License for registrant_2' do 
        @facility_1.add_service('Renew License')
        expect(@facility_1.renew_drivers_license(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end
    end
  end
end
    