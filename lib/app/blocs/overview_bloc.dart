import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class OverviewBloc extends BlocBase {
  final _currentValueStreamController = BehaviorSubject<double>.seeded(0.0);
  final _payingStreamController = BehaviorSubject<int>.seeded(1);
  final _individualValueStreamController = BehaviorSubject<double>.seeded(0.0);
  final _percentageStreamController = BehaviorSubject<double>.seeded(0.0);
  final _waiterValueStreamController = BehaviorSubject<double>.seeded(0.0);
  final _totalStreamController = BehaviorSubject<double>.seeded(0);

  Stream<double> get outCurrentValue => _currentValueStreamController.stream;
  Sink<double> get inCurrentValue => _currentValueStreamController.sink;
  double get currentValue => _currentValueStreamController.value;

  Stream<int> get outPaying => _payingStreamController.stream;
  Sink<int> get inPaying => _payingStreamController.sink;
  int get paying => _payingStreamController.value;

  Stream<double> get outPercentage => _percentageStreamController.stream;
  Sink<double> get inPercentage => _percentageStreamController.sink;
  double get percentage => _percentageStreamController.value;

  Stream<double> get outIndividual => _individualValueStreamController.stream;
  Sink<double> get inIndividual => _individualValueStreamController.sink;
  double get individual => _individualValueStreamController.value;

  Stream<double> get outWaiter => _waiterValueStreamController.stream;
  Sink<double> get inWaiter => _waiterValueStreamController.sink;
  double get waiter => _waiterValueStreamController.value;

  Stream<double> get outTotal => _totalStreamController.stream;
  Sink<double> get inTotal => _totalStreamController.sink;
  double get total => _totalStreamController.value;

  void updateCurrentValue(double value) {
    inCurrentValue.add(value);
    calculate();
  }

  void updatePercentage(double value) {
    inPercentage.add(value);
    calculate();
  }

  void updatePaying(int n) {
    inPaying.add(n);
    calculate();
  }

  void calculate() {
    inWaiter.add(currentValue * (percentage / 100));

    var result = (currentValue / paying);
    inIndividual.add(result);
    inTotal.add(result + (waiter / paying));
  }

  @override
  void dispose() {
    _currentValueStreamController.close();
    _payingStreamController.close();
    _individualValueStreamController.close();
    _percentageStreamController.close();
    _waiterValueStreamController.close();
    _totalStreamController.close();
  }
}
