import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled/ui/billSplitter.dart';
import 'package:untitled/ui/card.dart';
import 'package:untitled/ui/wisdom.dart';

import 'ui/home.dart';

void main() => runApp(new MaterialApp(
  home: BillSplitter(),
));



//
// class Akmal extends Person{
//
// }
//
// class Nodir extends Person{
//
//   @override
//   void sayHello() {
//     // TODO: implement sayHello
//     super.sayHello();
//     // print('children');
//   }
// }
//
//
// class Person{
//   String name = '';
//   int age = 0;
//
//   var map = {
//     "a":"A",
//     "b":"A",
//     "c":"A",
//     "d":"A",
//   };
//   var list = [1,5,6];
//
//   void sayHello(){
//     print(map["c"]);
//     map.forEach((key, value) {
//
//     });
//     list.forEach((element) {
//
//     });
//   }
// }
//
//
// class Application extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "App",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.red),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hello world"),
//         ),
//         body: Center(),
//       ),
//     );
//   }
// }

// class MyFlutterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Hello Shohboz",
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: FlutterPage(title: "Hello Shohboz"),
//     );
//   }
// }
// class FlutterPage extends StatefulWidget {
//   FlutterPage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _FlutterPage createState() => _FlutterPage();
// }
//
// class _FlutterPage extends State<FlutterPage> {
//   int counter = 0;
//
//   void incrementCounter() {
//     setState(() {
//       counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "This is app",
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             Text(
//               "$counter",
//               style: Theme.of(context).textTheme.headline4,
//             )
//           ],
//         ),
//       ),
//       backgroundColor: Colors.cyanAccent,
//       floatingActionButton: FloatingActionButton(
//         onPressed: incrementCounter,
//         tooltip: "Increment",
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
