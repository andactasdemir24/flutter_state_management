import 'package:flutter/material.dart';
import 'package:state_management/appbar_icon.dart';
import 'package:state_management/counter_state.dart';
import 'package:state_management/list_view_container.dart';
import 'package:state_management/list_view_state.dart';
import 'package:state_management/model/post.dart';

import 'counter_text.dart';
import 'service/service_locator.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Post postToAdd = Post(
    userId: 99,
    id: 99,
    title: "asdfasdf",
    body: "qwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwe",
  );

  @override
  void initState() {
    super.initState();
    final state = getIt.get<CounterState>();
    state.counter.addListener(() {
      if (state.counter.value % 10 == 0 && state.counter.value > 0) {
        _showMyDialog();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Reset'),
              onPressed: () {
                Navigator.of(context).pop();
                final state = getIt.get<CounterState>();
                state.resetCounter();
              },
            ),
            TextButton(
              child: const Text('Countiue'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          AppBarIcon(),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const CounterText(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.incrementCounter();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.decrementCounter();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final state = getIt.get<CounterState>();
                state.resetCounter();
              },
              child: const Icon(Icons.refresh),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: const ListViewContainer(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getIt.get<ListViewState>().postAdd(postToAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
