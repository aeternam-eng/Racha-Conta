import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc implements BlocBase {
  var _messageStreamController = BehaviorSubject<String>.seeded("Seu animal.");
  Stream<String> get outMessage => _messageStreamController.stream;
  Sink<String> get inMessage => _messageStreamController.sink;

  var _counterStreamController = BehaviorSubject<int>.seeded(0);
  Stream<int> get outCounter => _counterStreamController.stream;
  Sink<int> get inCounter => _counterStreamController.sink;

  void increment() {
    inCounter.add(_counterStreamController.value + 1);
  }

  void addToMessage() {
    if (_messageStreamController.value == "Seu animal.")
      inMessage.add(_messageStreamController.value +
          "\nNão desista. Você tem capacidade de ser ainda mais.");
  }

  @override
  void dispose() {
    _counterStreamController.close();
    _messageStreamController.close();
  }
}
