import 'package:grpc/grpc.dart';

import '../../../generated/campus.pbgrpc.dart';

class CampusService {
  CampusService._internal();
  static final CampusService _instance = CampusService._internal();

  factory CampusService() => _instance;

  ///static CampusService instance that we will call when we want to make requests
  static CampusService get instance => _instance;
  ///CampusClient is the  class that was generated for us when we ran the generation command
  ///We will pass a channel to it to intialize it
  late CampusClient _campusClient;

  ///this will be used to create a channel once we create this class.
  ///Call CampusService().init() before making any call.
  Future<void> init() async {
    _createChannel();
  }

  ///provide public access to the CampusClient instance
  CampusClient get campusClient {
    return _campusClient;
  }

  ///here we create a channel and use it to initialize the CampusClient that was generated
  _createChannel() {
    final channel = ClientChannel(
      "api.tum.app/v1",
      port: 443,
      options: const ChannelOptions(),
    );
    _campusClient = CampusClient(channel);
  }
}