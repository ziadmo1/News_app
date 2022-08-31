import 'package:flutter/material.dart';
import 'package:newss_app/screens/home_screen.dart';
import 'package:newss_app/my_themes/my_themes.dart';
import 'package:newss_app/screens/news_details_screen/news_details.dart';
import 'package:newss_app/screens/news_screen/news_screen.dart';
import 'package:newss_app/screens/news_details_screen/web_view.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
      routes: {
          HomeScreen.routeName :(_)=>HomeScreen(),
          NewsDetails.routeName:(_)=>NewsDetails(),
        WebViewScreen.routeName:(_)=>WebViewScreen(),

      },
        theme: MyThemeData.lightTheme,
    );
  }
}
