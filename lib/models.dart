class Flight {
  final double price;
  final String departureTime;
  final String landingTime;
  final Airplane airplane;
  List<Ticket> tickets = [];
  final City originCity;
  final City destinationCity;
  Flight(
      {required this.price,
      required this.departureTime,
      required this.landingTime,
      required this.airplane,
      required this.originCity,
      required this.destinationCity});

  void addTicket(Ticket ticket) {
    tickets.add(ticket);
  }
}

class Airplane {
  double profit = 0;
  final String name;
  final String model;
  final int capacity;
  List<Flight> flights = [];

  Airplane({required this.name, required this.model, required this.capacity});

  void addToProfit(double amount) {
    profit += amount;
  }

  void addFlight(Flight flight) {
    flights.add(flight);
  }
}

class Day {
  List<Flight> flights = [];

  void addFlight(Flight flight) {
    flights.add(flight);
  }
}

class City {
  final String name;
  final String country = "Iran";
  City({required this.name});
}

class Year {
  List<Month> months = [];
}

class Ticket {
  final Passenger passenger;
  final double price;
  Ticket({required this.passenger, required this.price});
}

class Month {
  List<Day> day = [];
}

class Discount {
  double total = 0;
  double percent = 0;

  void addToTotal(double amount) {
    total += amount;
  }

  void changePercent(double percent_) {
    percent = percent_;
  }
}

class Passenger {
  Discount discount = Discount();
  final String name;
  final String nationalCode;
  List<int> phones = [];
  Passenger({required this.name, required this.nationalCode});

  void addPhone(int phone) {
    phones.add(phone);
  }
}
