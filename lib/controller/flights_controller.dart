import '../models.dart';

class FlightsController {
  static Map<String, List> flights = {};
  static int lastAddedAirplane = 0;

  static void addFlight(String date, Flight flight) {
    flight.airplane!.flights.add(flight);
    if (flights.containsKey(date)) {
      flights[date]!.add(flight);
      return;
    }
    List list = [flight];
    flights[date] = list;
  }

  static List getFlightByDate(String date) => flights[date] ?? [];

  static List getFlights() {
    List flights_ = [];
    for (List i in flights.values) {
      for (Flight j in i) {
        flights_.add(j);
      }
    }
    return flights_;
  }

  static int getFlightNum() => lastAddedAirplane++;
}
