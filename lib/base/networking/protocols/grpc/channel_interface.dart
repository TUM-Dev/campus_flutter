import 'package:grpc/grpc.dart';
import 'stub_channel.dart'
  if (dart.library.html) 'grpc_web_channel.dart'
  if (dart.library.io) 'grpc_channel.dart';

abstract class PlatformIndependentGrpcClientChannel {
  ClientChannel getChannel();
  factory PlatformIndependentGrpcClientChannel() => getPlatformIndependentGrpcClientChannel();
}