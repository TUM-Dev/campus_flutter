import 'package:grpc/grpc.dart';

import 'channel_interface.dart';

class GrpcClientChannel implements PlatformIndependentGrpcClientChannel {
  @override
  ClientChannel getChannel() => ClientChannel(
    "api.tum.app",
    port: 443,
    options: const ChannelOptions(),
  );
}

PlatformIndependentGrpcClientChannel getPlatformIndependentGrpcClientChannel() => GrpcClientChannel();