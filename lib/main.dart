import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import "homeViewWidget.dart";

class Post{//todo 投稿の情報

}


final provider = StateProvider((ref){
  final test = [
    "あ",
    "い",
    "う",
    "え",
    "お",
  ];
  return test;
});





void main(){
  final app = MaterialApp(
    home: Scaffold(
      body: Center(
        child: Homeview(),
      ),
    ),
  );

  runApp(
    ProviderScope(
      child: app,
    )
  );
}


