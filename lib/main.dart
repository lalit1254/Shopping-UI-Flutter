import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningproject/pages/cart_page.dart';
import 'package:learningproject/pages/help_page.dart';
import 'package:learningproject/pages/profile_page.dart';
import 'package:learningproject/utlis/routes.dart';
import 'package:learningproject/widgets/themes.dart';
import 'pages/login_page.dart';

import 'pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      //darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      
     
      routes: {
       "/":(context) => LoginPage(),
      MyRoutes.homeRoute: (context) => Homepage(),
      MyRoutes.loginRoute:(context) => LoginPage(),
      MyRoutes.cartRoute:(context) => CartPage(),
      MyRoutes.profileRoute:(context) => ProfilePage(),
       MyRoutes.helpRoute:(context) => HelpPage(),
      },
      
    );
  }
}   