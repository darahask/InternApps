import 'package:cws_app/info_screens/complete_info.dart';
import 'package:cws_app/info_screens/dash_info.dart';
import 'package:cws_app/info_screens/employee_info.dart';
import 'package:cws_app/info_screens/feed_info.dart';
import 'package:cws_app/info_screens/messags_info.dart';
import 'package:cws_app/info_screens/status_info.dart';
import 'package:flutter/material.dart';

class InfoMain extends StatefulWidget {
  final int state;
  InfoMain({this.state});

  @override
  _InfoMainState createState() => _InfoMainState();
}

class _InfoMainState extends State<InfoMain> {

  int num = 0;
  final widgets = [FeedInfo(),DashInfo(),StatusInfo(),MessagesInfo(),CompleteInfo(),EmployeeInfo()];

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
                Icons.dashboard,
              ),
              title: Text(
                'Dashboard',
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
                'Employees',
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
