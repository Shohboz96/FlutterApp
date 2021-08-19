import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("Card"),
        centerTitle: true,
      ),
      body: Container(

        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            getCard(),
            getAvatar()
          ],
        ),
      ),
    );
  }

  Container getCard() {
    return Container(
      width: 310,
      height: 200,
      margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 62.0,bottom: 32.0),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Shohboz Qoraboyev",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500,color: Colors.white),),
          Text("shohbozqoraboyev@Gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person_outline), Text("Main Person")],
          )
        ],
      ),
    );
  }

  Container getAvatar() {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 0.0,bottom: 160.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.red.shade600, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              // fit: BoxFit.cover
          )),
    );
  }
}
