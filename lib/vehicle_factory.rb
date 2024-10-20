class Vehicle_factory

  def initialize
    @new_vehicles = []
    @engine = :ev
  end
  def create_vehicles(wa_ev_registrations)
    wa_ev_registrations.map do |wa_ev_registrations|
      @new_vehicles << (
          @engine = :ev
          


      )
    end
  end
end