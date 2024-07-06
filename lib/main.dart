import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import "homeViewWidget.dart";

class Post{//todo 投稿の情報
  Post(this.dateTime,this.mainContents,this.images,this.user);//コンストラクタ

  DateTime dateTime;//日付
  String mainContents;//本文
  List<XFile> images;//画像
  User user;//投稿者
  int nice = 0;//いいねの数
  List<User> niceUser = [];//いいねした人
}
class User{
  User(this.iconImage);
  String userName = "No Name Penguin";
  XFile iconImage;
  String profile = "";
  List<Post> myPost = [];
  int followCnt = 0;
  List<User> followUser = [];
  int followerCnt = 0;
  List<User> followerUser =[];




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


