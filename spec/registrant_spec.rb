require './lib/registrant'
require 'pry'
require 'rspec'

RSpec.describe Registrant do
  describe '#initialize' do
    before(:each) do 
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 15 )
    end

    it 'has attributes' do
      # expect(@registrant).to be_instance_of(Registrant)
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_1.permit?).to be(true)
      expect(@registrant_2.permit?).to be(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      #binding.pry
    end

    it 'can earn_permit' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to be(true)
      # binding.pry
    end

  end
end