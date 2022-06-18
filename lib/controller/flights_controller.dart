import '../models.dart';

class FlightsController {
  static Map<DateTime, List> flights = {};
  static int lastAddedAirplane = 0;

  static void addFlight(DateTime date, Flight flight) {
    if (flights.containsKey(date)) {
      flights[date]!.add(flight);
      return;
    }
    List list = [flight];
    flights[date] = list;
  }

  static List getFlights() {
    List flights = [];
    for (var i in flights) {
      for (var j in i) {
        flights.add(j);
      }
    }
    return flights;
  }
}
