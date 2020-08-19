import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class OverviewBloc extends BlocBase {
  final _currentValueStreamController = BehaviorSubject<double>.seeded(0.0);
  final _payingStreamController = BehaviorSubject<double>.seeded(0.0);
  final _individualValueStreamController = BehaviorSubject<double>.seeded(0.0);
  final _waiterValueStreamController = BehaviorSubject<double>.seeded(0.0);

  Stream<double> get outCurrentValue => _currentValueStreamController.stream;
  Sink<double> get inCurrentValue => _currentValueStreamController.sink;
  double get currentValue => _currentValueStreamController.value;

  Stream<double> get outPaying => _payingStreamController.stream;
  Sink<double> get inPaying => _payingStreamController.sink;
  double get paying => _payingStreamController.value;

  Stream<double> get outIndividual => _individualValueStreamController.stream;
  Sink<double> get inIndividual => _individualValueStreamController.sink;
  double get individual => _individualValueStreamController.value;

  Stream<double> get outWaiter => _waiterValueStreamController.stream;
  Sink<double> get inWaiter => _waiterValueStreamController.sink;
  double get waiter => _waiterValueStreamController.value;

  void calculate() {}

  @override
  void dispose() {
    _currentValueStreamController.close();
    _payingStreamController.close();
    _individualValueStreamController.close();
    _waiterValueStreamController.close();
  }
}
