import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<StatefulWidget> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: 'Active Ticket'),
                Tab(text: 'All Transaction'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildNoTicket(),
                      ],
                    ),
                  ),
                  // Tab 2
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildNoTicket(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoTicket() {
    return Container(
      child: Column(
        children: [
          FaIcon(FontAwesomeIcons.ticket, size: 54),
          SizedBox(height: 12),
          Text('Join the adventure - Book Your Movie Tickets!'),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF205979),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Explore Movies',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}