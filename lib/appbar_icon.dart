import 'package:flutter/material.dart';
import 'package:state_management/counter_state.dart';
import 'package:state_management/service/service_locator.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();
    return ValueListenableBuilder<int>(
        valueListenable: state.counter,
        builder: (context, counterValue, _) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: counterValue >= 0
                  ? const Icon(
                      Icons.mood,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.mood_bad,
                      color: Colors.red,
                    ));
        });
  }
}
