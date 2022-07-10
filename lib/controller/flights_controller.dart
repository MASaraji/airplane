import 'package:airplane/ADT/hash_table.dart';
import '../ADT/array.dart';
import '../models.dart';

class FlightsController {
  static HashTable<int, Year> flights = HashTable();
  //static Map<String, List> flights = {};
  static int lastAddedAirplane = 0;

  static void addFlight(DateTime date, Flight flight) {
    Year? year = flights.get(date.year);
    if (year == null) {
      year = Year(year: date.year);
      flights.addUnique(year.year, year);
    }
    Month month = year.getMonth(date.month);
    Day? day = month.getDay(date.day);
    if (day == null) {
      day = Day(day: date.day);
      month.addDay(day);
    }
    day.addFlight(flight);
    flight.airplane.addFlight(flight);
  }

  //static void addFlight(String date, Flight flight) {
  //  flight.airplane.flights.add(flight);
  //  if (flights.containsKey(date)) {
  //    flights[date]!.add(flight);
  //    return;
  //  }
  //  List list = [flight];
  //  flights[date] = list;
  //}
  static List getFlightByDate(DateTime date) {
    Year? year = flights.get(date.year);
    if (year == null) {
      return [];
    }
    Month month = year.getMonth(date.month);
    Day? day = month.getDay(date.day);
    if (day == null) {
      return [];
    }
    return day.flights;
  }

  //static List getFlightByDate(String date) => flights[date] ?? [];
  static List getFlights() {
    List list = [];
    Array years = flights.getValues();
    for (var year in years.traverse()) {
      list += year.getFlights();
    }
    return list;
  }

  //static List getFlights() {
  //  List flights_ = [];
  //  for (List i in flights.values) {
  //    for (Flight j in i) {
  //      flights_.add(j);
  //    }
  //  }
  //  return flights_;
  // }

  static int getFlightNum() => lastAddedAirplane++;
}
