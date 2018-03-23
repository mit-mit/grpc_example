import 'dart:async';
import 'package:grpc/grpc.dart';
import '../generated/greeter.pb.dart';
import '../generated/greeter.pbgrpc.dart';

Future<Null> main(List<String> args) async {
  final channel = new ClientChannel('localhost',
      port: 50051,
      options: const ChannelOptions(
          credentials: const ChannelCredentials.insecure()));

  final client = new GreeterClient(channel);
  try {
    final request = new HelloRequest()..name = 'Michael';
    final response = await client.sayHello(request);
    print('Greeter client received: ${response.message}');
  } catch (e) {
    print('Caught error: $e');
  }

  await channel.shutdown();
}
