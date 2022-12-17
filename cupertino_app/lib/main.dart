import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(primaryColor: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedValue = 1;
  double sliderValue = 0.0;

  onValueChange(e) {
    setState(() {
      selectedValue = e;
    });
  }

  onSliderValueChange(e) {
    setState(() {
      sliderValue = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Hello"),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(),
            const SizedBox(
              height: 16,
            ),
            CupertinoButton.filled(child: Text("Button"), onPressed: () {}),
            const SizedBox(
              height: 16,
            ),
            CupertinoButton(child: Text("Button"), onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => Container(
                  height: 216,
                  padding: const EdgeInsets.only(top: 6.0),
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  child: SafeArea(
                    top: false,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      use24hFormat: true,
                      // This is called when the user changes the dateTime.
                      onDateTimeChanged: (DateTime newDateTime) {
                      },
                    ),
                  ),
                )
              );
            }),
            CupertinoContextMenu(
              actions: [
                CupertinoContextMenuAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Action 1",
                      ),
                    ],
                  ),
                ),
                CupertinoContextMenuAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Action 2",
                  ),
                ),
              ],
              child: const FlutterLogo(size: 30),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: 300,
                child: CupertinoSegmentedControl(children: const {
                  1: Text("1"),
                  2: Text("2"),
                  3: Text("3"),
                }, onValueChanged: onValueChange, groupValue: selectedValue)),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 300,
              child: CupertinoSlidingSegmentedControl(
                children: {
                  1: Text("1"),
                  2: Text("2"),
                  3: Text("3"),
                },
                onValueChanged: onValueChange,
                groupValue: selectedValue,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CupertinoSlider(
                value: sliderValue,
                min: 0,
                max: 100,
                onChanged: onSliderValueChange),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CupertinoTextField(
                textInputAction: TextInputAction.next,
                restorationId: 'login_password_text_field',
                placeholder: "password",
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
                autocorrect: false,
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
