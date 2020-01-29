import 'package:cws_app/client_classes/client_messages.dart';
import 'package:cws_app/client_classes/cstatus_info.dart';
import 'package:cws_app/client_classes/plan_info.dart';
import 'package:cws_app/info_screens/complete_info.dart';
import 'package:cws_app/info_screens/feed_info.dart';
import 'package:cws_app/info_screens/messags_info.dart';
import 'package:flutter/material.dart';

class ClientInfo extends StatefulWidget {
  @override
  _ClientInfoState createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  int num = 0;
  final widgets = [FeedInfo(),ClientStatus(),ClientMessages(),CompleteInfo(),OurPlan()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widgets[num],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.collections,
              ),
              title: Text(
                'Feed',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.computer,
              ),
              title: Text(
                'Working Status',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              title: Text(
                'Messages',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_turned_in,
              ),
              title: Text(
                'Completed',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
              ),
              title: Text(
                'OurPlan',
              ),
            ),
          ],
          onTap: (a){
            setState(() {
              num = a;
            });
          },
          unselectedItemColor: Colors.black.withAlpha(150),
          currentIndex: num,
          selectedItemColor: Color(0xff09a5e0),
          showSelectedLabels: true,

        ),
      ),
    );
  }
}
