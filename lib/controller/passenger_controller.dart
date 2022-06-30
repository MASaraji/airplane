import '../models.dart';

class PassengerController {
  static Map<String, Passenger> passengers = {};

  static void addPassenger(Passenger passenger) {
    if (passengerIsExist(passenger.nationalCode)) {
      return;
    }
    passengers[passenger.nationalCode] = passenger;
  }

  static getPassenger(String nationalCode) => passengers[nationalCode];

  static bool passengerIsExist(String nationalCode) =>
      passengers.containsKey(nationalCode);
}
