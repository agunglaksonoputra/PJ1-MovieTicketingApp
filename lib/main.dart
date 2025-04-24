import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movify/screens/auth/login_page.dart';
import 'package:movify/screens/home/home_page.dart';
import 'package:movify/screens/movie/detail_movie_page.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movify App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/detailMovie',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/detailMovie': (context) => const DetailMovie(),
      },
    );
  }
}