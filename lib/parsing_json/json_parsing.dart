
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  const JsonParsingSimple({Key? key}) : super(key: key);

  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  late Future data;

  @override
  void initState() {
    super.initState();
    data = getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing Json"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
           future: getData(),
             builder: (context, AsyncSnapshot snapshot){
             if(snapshot.hasData){
               return createListView(snapshot.data, context);
               // return Padding(
               //   padding: const EdgeInsets.all(18.0),
               //   child: Text(
               //       snapshot.data[0]['userId'].toString()
               //   ),
               // );
             }else{
               return CircularProgressIndicator();
             }

             },
          ),
        ),
      ),
    );
  }
  Future getData() async{
    Future data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);

    data = network.fetchData();
    data.then((value){
      print(value[0]['title']);
    });
    print(data);
    return data;
  }

  Widget createListView(data, BuildContext context) {
    return  Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index){

          return Container(
            margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text("${data[index]['title']}",style: TextStyle(color: Colors.blueGrey.shade900),),
                  subtitle: Text("${data[index]['body']}",style: TextStyle(color: Colors.blueGrey.shade700)),
                  leading:
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 23,
                    child: Text("${data[index]['userId']}"),
                  ),
                )
              ],
            ),
          );
      }),
    );
  }
}
class Network{
  final String url;

  Network(this.url);

  Future fetchData() async{
    print("$url");
    Response response = await get(Uri.parse(Uri.encodeFull(url),));

    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      print(response.statusCode);
    }
  }
}
