import 'package:flutter/material.dart';
import 'package:ichabod/src/view_models/app_key.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Keys()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        brightness: Brightness.dark, 
        primaryColor: Colors.amber,
      
        tabBarTheme: TabBarTheme(),
        iconTheme: IconThemeData(),
      ),
      home: IchabodHome(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{},
    ),
  ));
}
