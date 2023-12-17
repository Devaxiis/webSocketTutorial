
import 'package:flutter/material.dart';
import 'package:web_socket/presentation/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true,),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
