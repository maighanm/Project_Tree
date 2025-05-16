import 'package:assigment_flutter/add_item/item_model.dart';
import 'package:assigment_flutter/dashboard/dashboard_screen.dart';
import 'package:assigment_flutter/dashboard/nav_bar.dart';
import 'package:assigment_flutter/favorite/favorite_model.dart';
import 'package:assigment_flutter/profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard/dashboard_screen.dart';
import 'details/details_screen/details_page.dart';
import 'add_item/add_item_screen.dart';


//kenzyyy
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: NavBar(),
    );
  }
}
