import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movify/screens/account/account_page.dart';
import 'package:movify/screens/home/home_page.dart';
import 'package:movify/screens/ticket/ticket_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screenList = const [
    HomePage(),
    TicketPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _screenList[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Color(0xFF205979),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.ticket), label: 'Ticket'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}