import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'homeViewWidget.dart';
import 'main.dart';



class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends ConsumerState<ProfileView> {

  @override
  void initState(){

  }


  @override
  Widget build(BuildContext context) {

    final profileScaffold =Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("myPenguin"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(""),//ここに部品を入れる
      ),
    );

    return profileScaffold;
  }
}
