class LocomotiveEngineer
  def self.generate_list_of_wagons(*args)
    args
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, third, *the_rest = each_wagons_id
    new_array = third, missing_wagons, the_rest, first, second
    new_array.flatten
  end

  def self.add_missing_stops(origin_and_destination, **stops)
    { "from": origin_and_destination[:from],
      to: origin_and_destination[:to],
      stops: stops.values }
  end

  def self.extend_route_information(route, more_route_information)
    binding.pry
  end
end


# LocomotiveEngineer.add_missing_stops({from: "New York", to: "Miami"},
#                     stop_1: "Washington, DC", stop_2: "Charlotte", stop_3: "Atlanta",
#                     stop_4: "Jacksonville", stop_5: "Orlando")
# # => {from: "New York", to: "Miami", stops: ["Washington, DC", "Charlotte", "Atlanta", "Jacksonville", "Orlando"]}
