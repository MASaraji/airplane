import 'package:airplane/ADT/array.dart';
import 'package:airplane/ADT/hash_table.dart';
import 'package:airplane/ADT/linkedlist.dart';
import 'package:airplane/ADT/trie.dart';
import 'package:flutter/material.dart';

class Flight {
  final String flightName;
  final double price;
  final String departDate;
  final TimeOfDay departureTime;
  final TimeOfDay landingTime;
  final Airplane airplane;
  int numberOfTicket = 0;
  late Array<Ticket> tickets = Array(airplane.capacity);
  final City? originCity;
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
}

class Ticket {
  final Passenger passenger;
  final double price;
  Ticket({required this.passenger, required this.price});
}

class Month {
  final int month;
  HashTable days = HashTable(threshold: 3, arrayLength: 11);
  Month({required this.month});
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
  Passenger({required this.name, required this.nationalCode});

  void addPhone(int phone) => phones.add(phone.toString(), phone);
}
