///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library greeter_pbgrpc;

import 'dart:async';

import 'package:grpc/grpc.dart';

import 'greeter.pb.dart';
export 'greeter.pb.dart';

class GreeterClient extends Client {
  static final _$sayHello = new ClientMethod<HelloRequest, HelloReply>(
      '/Greeter/SayHello',
      (HelloRequest value) => value.writeToBuffer(),
      (List<int> value) => new HelloReply.fromBuffer(value));

  GreeterClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<HelloReply> sayHello(HelloRequest request,
      {CallOptions options}) {
    final call = $createCall(_$sayHello, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class GreeterServiceBase extends Service {
  String get $name => 'Greeter';

  GreeterServiceBase() {
    $addMethod(new ServiceMethod<HelloRequest, HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        (List<int> value) => new HelloRequest.fromBuffer(value),
        (HelloReply value) => value.writeToBuffer()));
  }

  Future<HelloReply> sayHello_Pre(
      ServiceCall call, Future<HelloRequest> request) async {
    return sayHello(call, await request);
  }

  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request);
}
