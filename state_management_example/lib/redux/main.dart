import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(const MyApp());
}

enum Actions { Increment, Decrement }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  if (action == Actions.Decrement) {
    return state - 1;
  }
  return state;
}

final store = Store<int>(counterReducer, initialState: 0);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) => Text(
                count,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<int, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Actions.Increment);
        },
        builder: (context, callback) => FloatingActionButton(
          onPressed: callback,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) => Text(
                count,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<int, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Actions.Decrement);
        },
        builder: (context, callback) => FloatingActionButton(
          onPressed: callback,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
