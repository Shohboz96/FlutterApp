import 'package:flutter/material.dart';



void main() {
  var mic = new Microphone();
  print(mic.name);
  print(mic.name);


}
class Microphone{
  String name = 'a';
  int age = 5;

  // Microphone(this.name,this.age);
  String get getName => name;
   set setName(String s) => name = s;

}
