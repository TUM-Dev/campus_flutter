import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_web.dart';

import 'channel_interface.dart';

class WebClientChannel implements PlatformIndependentGrpcClientChannel {
  @override
  ClientChannel getChannel() => GrpcWebClientChannel.xhr(Uri.parse('https://api-grpc.tum.app')) as ClientChannel;
}

PlatformIndependentGrpcClientChannel getPlatformIndependentGrpcClientChannel() => WebClientChannel();