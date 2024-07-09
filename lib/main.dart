import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import "homeViewWidget.dart";
import 'profile.dart';


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

class BaseWidget extends ConsumerStatefulWidget {
  const BaseWidget({super.key});

  @override
  BaseWidgetState createState() => BaseWidgetState();
}

class BaseWidgetState extends ConsumerState<BaseWidget> {
  @override
  Widget build(BuildContext context) {


    // ページの情報
    final pages = [
      const Homeview(),
      const ProfileView()
    ];

    return Scaffold(
      body: PersistentTabView(
        context,
        screens: pages,
        navBarStyle: NavBarStyle.simple,
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            inactiveIcon: Icon(Icons.home_outlined),
            title: "ホーム",
            activeColorPrimary: Colors.cyan,
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          // PersistentBottomNavBarItem(
          //   icon: Icon(Icons.favorite),
          //   inactiveIcon: Icon(Icons.favorite_border),
          //   title: "お気に入り",
          //   activeColorPrimary: Colors.cyan,
          //   inactiveColorPrimary: Theme.of(context).disabledColor,
          // ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.person),
            inactiveIcon: Icon(Icons.person),
            title: "マイページ",
            activeColorPrimary: Colors.cyan,
            inactiveColorPrimary: Theme.of(context).disabledColor,
          )
        ],
      ),
    // todo https://zenn.dev/maguroburger/articles/use_persistent_bottom_nav_bar
    );
  }
}





void main(){
  final app = MaterialApp(
    home: Scaffold(
      body: Center(
        child: BaseWidget(),
      ),
    ),
  );

  runApp(
    ProviderScope(
      child: app,
    )
  );
}


