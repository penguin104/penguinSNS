import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';

//todo 新規作成・ログイン画面作成firebaseと連携もする

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {


    final idTextController = TextEditingController();
    final passTextController = TextEditingController();

    final idTextField = TextField(
      controller: idTextController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "アカウントIDを入力",
        hintText: "アカウントID",
      ),
    );

    final passTextField = TextField(
      controller: passTextController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "パスワードを入力",
        hintText: "パスワード",
      ),
    );

    final loginButton = ElevatedButton(
        onPressed: (){
          //ログイン
        },
        child: Text("ログイン"),
    );

    final createAccountButton = ElevatedButton(
        onPressed: (){
          //新規アカウント作成
        },
        child: Text("新たなペンギンの誕生"),
    );

    return const Placeholder();
  }
}



