import 'package:flutter/material.dart';

class CounterState {
  //int _counter = 0;
  ValueNotifier<int> counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }

  void decrementCounter() {
    counter.value--;
  }

  void resetCounter() {
    counter.value = 0;
  }
}
