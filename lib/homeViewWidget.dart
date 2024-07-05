import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';


Widget PostModeltoWidget(BuildContext context, WidgetRef ref){//ここに投稿の見た目を作る

  final listState = ref.watch(provider);

  return;
}



class Homeview extends ConsumerStatefulWidget {
  const Homeview({super.key});

  @override
  HomeviewState createState() => HomeviewState();
}

class HomeviewState extends ConsumerState<Homeview> {
  @override
  Widget build(BuildContext context) {

  final testProvider = ref.watch(provider.notifier);

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        fixedColor: Color(0xffffaf0f),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home,
                  color: Colors.white
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.search,
                  color: Colors.white
              ),
              label:"serch"),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.person,
                  color: Colors.white),
              label: "person"),
        ],
      ),
    );

    return homeViewScaffolld;
  }
}