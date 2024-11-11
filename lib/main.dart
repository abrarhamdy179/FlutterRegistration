import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/login_provider.dart';
import 'Providers/signup_provider.dart';
import 'Screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SignUpProvider()),
        ChangeNotifierProvider(create: (context)=>LoginProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupScreen(),
      ),
    );
  }
}