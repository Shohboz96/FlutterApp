import 'package:flutter/material.dart';
import 'package:untitled/util/hexcolor.dart';

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  var _index = 0;

  List quotes = [
    "cnddcdc ddn dvfbhefb cvgrdfvbd cfgvfdhf  dkc ",
    "n drg r ergretgrwefgr vdnvdn ahbdb lksnfv",
    "skmsdomv dj re ret vd o ie vi efvmrm",
    "dsnfi jcnciemci",
    "kbsdbc hhcbdibuiweb hiwbiduebu  wbub jbhi iwebihwbxu hwedhiubdiu hw iuedbu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(

                  color: Colors.transparent,

                  borderRadius: BorderRadius.circular(14.5)
                ),
                child: Center(child: Text(quotes[_index % quotes.length]))),
            Divider(
              thickness: 1.3,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: FlatButton.icon(
                    onPressed: showQuote,
                    color: Colors.greenAccent.shade700,
                    icon: Icon(Icons.wb_sunny),
                    label: Text(
                      "Click me!",
                      style: TextStyle(fontSize: 16.0, color: Colors.pink),
                    ))),
            Spacer()

          ],
        ),
      ),
    );
  }

  void showQuote() {
    setState(() {
      _index++;
    });
  }
}
