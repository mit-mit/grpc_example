import 'dart:async';
import 'package:grpc/grpc.dart';
import '../generated/greeter.pb.dart';
import '../generated/greeter.pbgrpc.dart';

class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return new HelloReply()..message = 'Hello, ${request.name}!';
  }
}

Future<Null> main(List<String> args) async {
  final server = new Server([new GreeterService()]);
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
