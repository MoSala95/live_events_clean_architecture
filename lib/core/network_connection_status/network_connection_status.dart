import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionStatus {
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

   Future<bool> get isConnected async => await connectionChecker.hasConnection;
}
