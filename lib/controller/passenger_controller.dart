import '../models.dart';

class PassengerController {
  static Map<String, Passenger> passengers = {};

  static void addPassenger(Passenger passenger) {
    if (passengers.containsKey(passenger.nationalCode)) {
      return;
    }
    passengers[passenger.nationalCode] = passenger;
  }

  static getPassenger(String nationalCode) {
    return passengers[nationalCode];
  }

  static bool passengerIsExist(String nationalCode) {
    return passengers.containsKey(nationalCode);
  }
}
