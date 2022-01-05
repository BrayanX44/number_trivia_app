import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NeteworkInfoImpl implements NetworkInfo{
  final DataConnectionChecker connectionChecker;

  NeteworkInfoImpl(this.connectionChecker);

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => connectionChecker.hasConnection;

}