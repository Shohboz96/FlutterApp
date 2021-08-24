import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = [
    Movie("Movie ksfdnskl ,mx c,mbfljkae ${Random.secure().nextInt(100)}",
        "subtitle ${Random.secure().nextInt(100)}",
        ["https://picsum.photos/200/200",
          "https://picsum.photos/200/200",
          "https://picsum.photos/200/200"]),
    Movie("Movie ${Random.secure().nextInt(100)}",
        "subtitle ${Random.secure().nextInt(100)}",
        ["https://picsum.photos/200/200",
          "https://picsum.photos/200/200",
          "https://picsum.photos/200/200"]),
    Movie("Movie ${Random.secure().nextInt(100)}",
        "subtitle ${Random.secure().nextInt(100)}",
        ["https://picsum.photos/200/200",
          "https://picsum.photos/200/200",
          "https://picsum.photos/200/200"]),
    Movie("Movie ${Random.secure().nextInt(100)}",
        "subtitle ${Random.secure().nextInt(100)}",
        ["https://picsum.photos/200/200",
          "https://picsum.photos/200/200",
          "https://picsum.photos/200/200"]),
    Movie("Movie ${Random.secure().nextInt(100)}",
        "subtitle ${Random.secure().nextInt(100)}",
        ["https://picsum.photos/200/200",
          "https://picsum.photos/200/200",
          "https://picsum.photos/200/200"]),
    Movie("Movie ${Random.secure().nextInt(100)}",
        "subtitle ${Random.secure().nextInt(100)}",
        ["https://picsum.photos/200/200",
          "https://picsum.photos/200/200",
          "https://picsum.photos/200/200"]),
  ];
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "Vikings",
    "Blade Runner",
    "Interstellar",
    "The Avengers",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie List"),
          backgroundColor: Colors.blueGrey.shade700,
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey.shade200,
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children:<Widget> [
                  Positioned(child: movieCard(movieList[index], context)),
                  Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: movieImage(movieList[index].images[0]))
                ],
              );
            }));
  }

  Widget movieImage(String url){
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(url),fit: BoxFit.cover
        )
      ),
    );
  }
  TextStyle mainTextStyle(){
    return TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 16.0);
  }


  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .height,
        height: 100.0,
        child: Card(
          margin: EdgeInsets.only(left: 54.0, right: 10.0,bottom: 5.0,top: 5.0),
          elevation: 5.0,
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(movie.title,style: mainTextStyle())),
                    Text(movie.subTitle, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue.shade900, fontSize: 12.0))
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(movie.title,style: mainTextStyle())),
                    Text(movie.subTitle, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue.shade900, fontSize: 12.0))
                  ],
                ),
              ],

            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieListDetails(movieName: movie.title,movie: movie,)));
      },
    );
  }
}

class MovieListDetails extends StatelessWidget {
  const MovieListDetails({Key? key, required this.movieName, required this.movie}) : super(key: key);
  final String movieName;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
            MovieDetailsThumbnail(thumbnail: movie.images[0]),
            MovieDetailsHeaderWithPoster(movie: movie)
        ],
      )
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
       Stack(
         alignment: Alignment.center,
         children: [
           Container(
             margin: EdgeInsets.all(12.0),
             width: MediaQuery.of(context).size.width,
             height: 190.0,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: NetworkImage(thumbnail),
                 fit: BoxFit.cover
               )
             ),
           ),
           Icon(Icons.play_circle_outline, size: 100,
           color:  Colors.white,)
         ],
       ),
        Container(
          height: 80.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0x00f5f5f5),
              Color(0xfff5f5f5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
        ),
      ],
    );
  }
}
class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[0].toString())
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget{
  final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      var borderRadius = BorderRadius.all(Radius.circular(10));
      return Card(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(poster), fit: BoxFit.cover
              )
            ),
          )
        ),
      );
  }
}





