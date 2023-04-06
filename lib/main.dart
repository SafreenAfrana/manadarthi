import 'package:flutter/material.dart';
import 'package:manadarthi/screens/login_screen.dart';
import 'package:manadarthi/providers/home/bottom_property_provider.dart';
import 'package:manadarthi/providers/home/home_property_provider.dart';
import 'package:manadarthi/providers/home/prime_property_provider.dart';
import 'package:manadarthi/providers/home/slider_provider.dart';
import 'package:manadarthi/providers/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePropertyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PrimePropertyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomPropertyProvider(),
        )
      ],
      child: MaterialApp(
          title: 'ManaDarthi',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: LoginScreen()),
    );
  }
}
