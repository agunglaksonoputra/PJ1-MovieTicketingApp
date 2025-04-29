import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movify/screens/account/about_page.dart';
import 'package:movify/screens/account/account_detail_page.dart';
import 'package:movify/screens/account/contact_us_page.dart';
import 'package:movify/screens/account/privacy_policy.dart';
import 'package:movify/screens/account/terms_of_service_page.dart';
import 'package:movify/screens/auth/login_page.dart';
import 'package:movify/screens/home/home_page.dart';
import 'package:movify/screens/main_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutUsPage(),
        '/account-detail': (context) => const AccountDetailPage(),
        '/faq': (context) => const ToSPage(),
        '/contact-us': (context) => const ContacUsPage(),
        '/privacy-policy': (context) => const PrivacyPolicyPage(),
      },
    );
  }
}