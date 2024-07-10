import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';


class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  FavoriteViewState createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoriteView> {
  @override
  Widget build(BuildContext context) {

    final favoriteViewScaffolld = Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("お気に入り",
          style: TextStyle(
              color:Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Text("favorite"),
      ),
    );


    return favoriteViewScaffolld;
  }
}
