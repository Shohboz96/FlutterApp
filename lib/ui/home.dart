import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  _tapButton() {
    debugPrint("Email tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        actions: [
          IconButton(onPressed: () => _tapButton(), icon: Icon(Icons.email)),
          IconButton(
              onPressed: () => _tapButton(), icon: Icon(Icons.access_alarm)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.mic),
        onPressed: () => debugPrint("action"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.email),title: Text("First")),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm),title: Text("Second")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text("Third")),
        // BottomNavigationBarItem(icon: Icon(Icons.list),title: Text("Fourth")),
      ],
      onTap: (int index) => debugPrint("tapped : $index"),
      backgroundColor: Colors.cyanAccent,),
      backgroundColor: Colors.cyanAccent.shade700,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(),
            // InkWell(
            //   child: Text(
            //     "Tap me!",
            //     style: TextStyle(fontSize: 23.4),
            //   ),
            //   onTap: () => debugPrint("tapped"),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello snack"),
          backgroundColor: Colors.amberAccent.shade700,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8.0),

        ),
        child: Text("Button"),
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.deepOrange,
//       child: Center(
//         child: Text(
//           "Hello Flutter",
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 23.4,
//               fontStyle: FontStyle.italic),
//         ),
//       ),
//     );
//     Center(
//         child: Text(
//       "Hello World",
//       textDirection: TextDirection.ltr,
//     ));
//   }
// }
