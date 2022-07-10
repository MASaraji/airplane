import 'package:airplane/ADT/hash_table.dart';
import '../ADT/array.dart';
import '../models.dart';

class FlightsController {
  static HashTable<int, Year> flights = HashTable();
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
    day.getFlights().represent();
    flight.airplane.addFlight(flight);
  }

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
    return day.getFlights().toList();
  }

  static List getFlights() {
    Array list = Array(0);
    Array years = flights.getValues();
    for (Year year in years.traverse()) {
      print("1");
      year.getFlights().represent();
      list.expand(year.getFlights());
      //list += year.getFlights();

    }
    list.represent();
    return list.toList();
  }

  static int getFlightNum() => lastAddedAirplane++;
}
