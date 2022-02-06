import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wordpair_generator/core/store.dart';
import 'package:wordpair_generator/screens/cart.dart';
import 'package:wordpair_generator/widgets/themes.dart';
import './screens/routes.dart';
import './screens/home.dart';
import './screens/login.dart';

void main() => runApp(VxState(
      child: MyApp(),
      store: Store(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: AppTheme.darkTheme(context),
        theme: AppTheme.lightTheme(context),
        routes: {
          AppRoutes.loginRoute: (context) => Login(),
          AppRoutes.homeRoute: (context) => Home(),
          AppRoutes.cartRoute: (context) => Cart(),
        });
  }
}
