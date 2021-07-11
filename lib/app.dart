import 'package:flutter/material.dart';

import 'package:payflow/modules/home/home_page.dart';
import 'modules/barCodeScannner/barCodeScannerCode.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash.dart';
import 'shared/themes/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/barcode_scanner': (context) => BarCodePage(),
      },
    );
  }
}
