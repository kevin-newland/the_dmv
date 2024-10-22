require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_factory'
require './lib/facility'
require 'pry'

RSpec.describe FacilityFactory do
  describe 'Colorado data set' do 
    before(:each) do
      @colorado = FacilityFactory.new
      @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    end

    describe '#initialize' do
      it 'can initialize' do
        @colorado.create_facilities(@co_dmv_office_locations)
        expect(@colorado).to be_an_instance_of(FacilityFactory)
        expect(@colorado.new_facilities).to be_a(Array)
      end
    end

    describe 'create_facilities' do
      it 'can create facilities' do 
        @colorado.create_facilities(@co_dmv_office_locations)
        expect(@colorado.new_facilities.shuffle.first.address).to be_a(String)
        expect(@colorado.new_facilities.shuffle.first.age).to be(nil)
        expect(@colorado.new_facilities.shuffle.first.collected_fees).to be_a(Integer)
        expect(@colorado.new_facilities.shuffle.first.name).to be_a(String)
        expect(@colorado.new_facilities.shuffle.first.phone).to be_a(String)
        expect(@colorado.new_facilities.shuffle.first.registered_vehicles).to be_a(Array)
        expect(@colorado.new_facilities.shuffle.first.services).to be_a(Array)
      end
    end
  end

  describe 'New York data set' do 
    before(:each) do
      @new_york = FacilityFactory.new
      @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    end

    describe '#initialize' do
      it 'can initialize' do
        @new_york.create_facilities(@new_york_facilities)
        expect(@new_york).to be_an_instance_of(FacilityFactory)
        expect(@new_york.new_facilities).to be_a(Array)
      end
    end

    describe 'create_facilities' do
      it 'can create facilities' do 
        @new_york.create_facilities(@new_york_facilities)
        expect(@new_york.new_facilities.shuffle.first.address).to be_a(String)
        expect(@new_york.new_facilities.shuffle.first.age).to be(nil)
        expect(@new_york.new_facilities.shuffle.first.collected_fees).to be_a(Integer)
        expect(@new_york.new_facilities.shuffle.first.name).to be_a(String)
        expect(@new_york.new_facilities.shuffle.first.phone).to (be_a(String).or be_nil)
        expect(@new_york.new_facilities.shuffle.first.registered_vehicles).to be_a(Array)
        expect(@new_york.new_facilities.shuffle.first.services).to be_a(Array)
      end
    end
  end

  describe 'Missouri data set' do 
    before(:each) do
      @missouri = FacilityFactory.new
      @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    end

    describe '#initialize' do
      it 'can initialize' do
        @missouri.create_facilities(@missouri_facilities)
        expect(@missouri).to be_an_instance_of(FacilityFactory)
        expect(@missouri.new_facilities).to be_a(Array)
      end
    end

    describe 'create_facilities' do
      it 'can create facilities' do 
        @missouri.create_facilities(@missouri_facilities)
        expect(@missouri.new_facilities.shuffle.first.address).to (be_a(String).or be_nil)
        expect(@missouri.new_facilities.shuffle.first.age).to be(nil)
        expect(@missouri.new_facilities.shuffle.first.collected_fees).to be_a(Integer)
        expect(@missouri.new_facilities.shuffle.first.name).to be_a(String)
        expect(@missouri.new_facilities.shuffle.first.phone).to be_a(String)
        expect(@missouri.new_facilities.shuffle.first.registered_vehicles).to be_a(Array)
        expect(@missouri.new_facilities.shuffle.first.services).to be_a(Array)
      end
    end
  end
end