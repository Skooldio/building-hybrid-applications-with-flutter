import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'counter.dart';

final counter = Counter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
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
            Observer(
                builder: (_) => Text(
                      '${counter.value}',
                      style: Theme.of(context).textTheme.headline4,
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
            Observer(
                builder: (_) => Text(
                      '${counter.value}',
                      style: Theme.of(context).textTheme.headline4,
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.decrement(),
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
