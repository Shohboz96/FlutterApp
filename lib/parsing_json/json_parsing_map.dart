import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/model/Post.dart';

class JsonParsingMap extends StatefulWidget {
  const JsonParsingMap({Key? key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  late Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshot) {
              List<Post> allPosts;
              if (snapshot.hasData) {
                allPosts = snapshot.data!.posts;
                return createList(allPosts, context);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget createList(List<Post> data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Container(
                margin: EdgeInsets.only(left: 12.0,right: 12.0, top: 12.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    border: Border.all(color: Colors.green.shade500,width: 1.5),
                    borderRadius: BorderRadius.circular(12.0)),

                child: ListTile(
                  title: Text(data[index].title),
                  subtitle: Text(data[index].body),
                  leading: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 23,
                      child: Text("${data[index].id}")),
                ));
          }),
    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future<PostList> loadPosts() async {
    final response = await get(Uri.parse(Uri.encodeFull(url)));
    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception("something went wrong");
    }
  }
}
