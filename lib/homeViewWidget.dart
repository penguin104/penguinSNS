import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';


Widget PostModeltoWidget(BuildContext context, Post post){//todo ここに投稿の見た目を作る

  // ユーザのアイコン
  final iconImage = Image.asset(
    post.user.iconImage.path,
    width: 60,
    height: 60,
  );
  // ユーザ名
  final userName = Text(post.user.userName);
  // 投稿された画像
  final imageList = ListView.builder(
    scrollDirection: Axis.horizontal,//横並び
    shrinkWrap: true,
    itemCount: post.images.length,
      itemBuilder: (context,i){
    return Image.asset(post.images[i].path);//todo firebaseに対応させる
  });
  // 本文
  final mainContents = Text(post.mainContents);
  // いいねボタン
  //todo いいねしたか表示
  final niceButton = IconButton(
      onPressed: (){},
      icon: Icon(Icons.favorite));

  //まとめる
  final row1 = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      iconImage,
      userName,
    ],
  );

  final row2 = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      mainContents,
      niceButton
    ],
  );

  final colPost = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      row1,
      imageList,
      row2
    ],
  );

  return colPost;
}



class Homeview extends ConsumerStatefulWidget {
  const Homeview({super.key});

  @override
  HomeviewState createState() => HomeviewState();
}

class HomeviewState extends ConsumerState<Homeview> {
  @override
  Widget build(BuildContext context) {

  final testProvider = ref.watch(providerPost.notifier);

    // 投稿をバーってする
    final homeList = ListView.builder(
      shrinkWrap: true,
      itemCount: testProvider.state.length,//リスト.length
      itemBuilder: (BuildContext context,int i) {
        return ListTile(title: Text("表示　${testProvider.state[i]}"),);
      }
    );


    final colHomeView = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [homeList],
    );
    final conHomeView = Container(
      child: colHomeView,//container in column
    );


    // 追加ボタン
    final addButton = Container(
      width: 80,
      height: 80,

      child: FloatingActionButton(
        onPressed: (){
          //処理
        },
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        child: Icon(
          Icons.add,
          size:40,
        ),

      ),
    );


    //returnするwidget
    final homeViewScaffolld = Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Penguin SNS(仮)",
          style: TextStyle(
              color:Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: conHomeView,
      ),

      floatingActionButton: addButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );

    return homeViewScaffolld;
  }
}

