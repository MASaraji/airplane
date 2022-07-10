import 'package:airplane/ADT/array.dart';
import 'package:airplane/ADT/hash_table.dart';
import 'package:airplane/ADT/linkedlist.dart';
import 'package:airplane/ADT/trie.dart';
import 'package:flutter/material.dart';

class Flight {
  final String flightName;
  final double price;
  final DateTime departDate;
  final TimeOfDay departureTime;
  final TimeOfDay landingTime;
  final Airplane airplane;
  int numberOfTicket = 0;
  late Array<Ticket> tickets = Array(airplane.capacity);
  final City? originCity;
  double occupacyRatio = 0;
  final City? destinationCity;
  Flight(
      {required this.flightName,
      required this.price,
      required this.departureTime,
      required this.landingTime,
      required this.departDate,
      required this.airplane,
      required this.originCity,
      required this.destinationCity});

  void addTicket(Ticket ticket) {
    tickets.add(numberOfTicket, ticket);
    numberOfTicket++;
    occupacyRatio = numberOfTicket / airplane.capacity;
  }
}

class Airplane {
  double profit = 0;
  final String name;
  final String model;
  final int capacity;
  LinkedList<Flight> flights = LinkedList();

  Airplane({required this.name, required this.model, required this.capacity});

  void addToProfit(double amount) => profit += amount;

  void addFlight(Flight flight) => flights.add(flight);
}

class City {
  final String name;
  final String country = "Iran";
  City({required this.name});
}

class Year {
  final int year;
  Array<Month> months = Array(12);

  Year({required this.year}) {
    for (int i = 0; i < 12; i++) {
      months.add(i, Month(month: i + 1));
    }
  }
  Month getMonth(int num) => months.getIndex(--num) as Month;

  List getFlights() {
    List list = [];
    for (Month month in months.traverse()) {
      for (Day day in month.getDays().traverse()) {
        list += day.getFlights();
      }
    }
    return list;
  }
}

class Ticket {
  final Passenger passenger;
  final double price;
  Ticket({required this.passenger, required this.price});
}

class Month {
  final int month;
  HashTable<int, Day> days = HashTable(threshold: 3, arrayLength: 11);
  Month({required this.month});

  addDay(Day day) => days.addUnique(day.day, day);
  getDays() => days.getValues();
  getDay(int day) => days.get(day);
}

class Day {
  int day;
  List flights = [];

  Day({required this.day});

  void addFlight(Flight flight) => flights.add(flight);

  List getFlights() => flights;
}

class Discount {
  double total = 0;
  double percent = 0;

  void addToTotal(double amount) => total += amount;
  void changePercent(double percent_) => percent = percent_;
}

class Passenger {
  Discount discount = Discount();
  final String name;
  final String nationalCode;
  Trie<int> phones = Trie();
  HashTable<String, Flight> flights = HashTable();
  Passenger({required this.name, required this.nationalCode});

  void addFlight(Flight flight) => flights.addUnique(flight.flightName, flight);
  bool flightExist(String flight) => flights.get(flight) != null;
  void addPhone(int phone) => phones.add(phone.toString(), phone);
}
