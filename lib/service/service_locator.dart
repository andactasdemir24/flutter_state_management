import 'package:get_it/get_it.dart';
import 'package:state_management/counter_state.dart';
import 'package:state_management/list_view_state.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerSingleton<CounterState>(CounterState());
  getIt.registerSingleton<ListViewState>(ListViewState());
}
