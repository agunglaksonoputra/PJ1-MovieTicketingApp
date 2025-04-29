import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage ({super.key});

  @override
  State<StatefulWidget> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF205979),
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft, color: Colors.white),
          iconSize: 30.0,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is MOVIFY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            SizedBox(height: 8),

            Text(
              'MOVIFY is the leading entertainment service application in Indonesia that provides a new experience in purchasing film tickets and other entertainment. With TIX ID, users can find out information about the latest films and order cinema tickets easily, quickly and safely.',
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 12),

            Text(
              'The MOVIFY application can be downloaded on the Play Store and App Store.',
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 12),

            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon:  FaIcon(FontAwesomeIcons.xTwitter),
                ),
                IconButton(
                  onPressed: () {},
                  icon:  FaIcon(FontAwesomeIcons.instagram),
                ),
                IconButton(
                  onPressed: () {},
                  icon:  FaIcon(FontAwesomeIcons.facebook),
                ),
              ],
            ),

            SizedBox(height: 20),

            Divider(
              color: Colors.grey,
              thickness: 1,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Got ant question?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Send a request',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF205979),
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}