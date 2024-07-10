import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penguin_sns/favorite.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import "homeViewWidget.dart";
import 'profile.dart';
import 'favorite.dart';


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
  String userName = "No Name Penguin";//ユーザ名
  XFile iconImage;//アイコン画像
  String profile = "";//プロフィール文
  List<Post> myPost = [];//自分の投稿
  int followCnt = 0;//フォロー数
  List<User> followUser = [];//フォローしてる人
  int followerCnt = 0;//フォロワー数
  List<User> followerUser =[];//フォロワー
}



final providerPost = StateProvider((ref){
  final test = [
    "あ",
    "い",
    "う",
    "え",
    "お",
  ];
  final List<Post> providerPost = [];
  return providerPost;
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
      const FavoriteView(),
      const ProfileView()
    ];

    return Scaffold(
      body: PersistentTabView(
        context,
        screens: pages,
        navBarStyle: NavBarStyle.style8,

        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            inactiveIcon: Icon(Icons.home_outlined),
            title: "ホーム",
            activeColorPrimary: Colors.cyan,
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.favorite),
            inactiveIcon: Icon(Icons.favorite_border),
            title: "お気に入り",
            activeColorPrimary: Colors.cyan,
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
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


