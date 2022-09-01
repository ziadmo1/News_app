import 'package:flutter/material.dart';
import 'package:newss_app/providers/locale_provider.dart';
import 'package:newss_app/screens/home_screen.dart';
import 'package:newss_app/my_themes/my_themes.dart';
import 'package:newss_app/screens/news_details_screen/news_details.dart';
import 'package:newss_app/screens/news_details_screen/web_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => AppConfigLocale(),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    AppConfigLocale provider = Provider.of<AppConfigLocale>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
        initialRoute: HomeScreen.routeName,
      routes: {
          HomeScreen.routeName :(_)=>HomeScreen(),
          NewsDetails.routeName:(_)=>NewsDetails(),
        WebViewScreen.routeName:(_)=>WebViewScreen(),
      },
        theme: MyThemeData.lightTheme,
      locale: Locale(provider.locale),
    );
  }
}
