
import 'dart:async';

main(List<String> argument) {
  streamTransformer();
}

streamTransformer(){
  //phát ra định kỳ 1s
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
    return value;
  });

  stream.transform(StreamTransformer.fromHandlers(handleData: (input,sink){
    var newValue = input * 1000;
    sink.add(newValue);
  }))
  .take(10)
  .listen((event) {
    print(event);
  });
}

streamController(){
  StreamController<int> controller = StreamController<int>();

  controller.stream.listen((event) {
    print(event);
  });

  controller.sink.add(100);
  controller.sink.add(200);
}

demoSingleScriptionPause() {
  //nguồn phát
  //stream
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
    return value;
  });

  var subscription = stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
  //3s pause
  Future.delayed(Duration(seconds: 3), (){
    subscription.pause(Future.delayed(Duration(microseconds: 100), (){
      print("Pause");
    }));
  });
  //3s tiếp
  Future.delayed(Duration(seconds: 6), (){
    subscription.resume();
  });
}

BroadcastStream() {
  //nguồn phát
  //stream
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
    return value;
  }).asBroadcastStream();

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
}

SingleScriptionStream() {
  //nguồn phát
  //stream
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
    return value;
  });

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
}

stream3() {
  //nguồn phát
  //stream
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
    return value;
  });

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
}

stream2() {
  //nguồn phát
  var data = Iterable<int>.generate(10, (value) {
    return value * 1000;
  });
  //stream
  Stream<int> stream = Stream<int>.fromIterable(data);

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
}

stream1() {
  //nguồn phát
  var data = Future<int>.delayed(Duration(seconds: 1), () {
    return 100;
  });
  //stream
  Stream<int> stream = Stream<int>.fromFuture(data);

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("Done");
  });
}
