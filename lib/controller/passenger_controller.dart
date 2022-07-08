import '../ADT/trie.dart';
import '../models.dart';

class PassengerController {
  static Trie<Passenger> passengers = Trie();

  static void addPassenger(Passenger passenger) =>
      passengers.add(passenger.nationalCode, passenger);

  static getPassenger(String nationalCode) => passengers.find(nationalCode);

  static bool passengerIsExist(String nationalCode) =>
      passengers.find(nationalCode) != null;
}
