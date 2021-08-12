import 'package:contact_list/home_page.dart';
import 'package:contact_list/login_page.dart';
import 'package:flutter/material.dart';
import 'helper/Constants.dart';

void main() => runApp(ContactListApp());

class ContactListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _routes = <String, WidgetBuilder>{
      loginPageTag: (context) => LoginPage(),
      homePageTag: (context) => HomePage(),
    };

    return MaterialApp(
      title: appTitle,
      theme: new ThemeData(
        primaryColor: appDarkGreyColor
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: _routes,
    );
  }
}