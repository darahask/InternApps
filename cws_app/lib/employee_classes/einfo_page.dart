import 'package:cws_app/employee_classes/edash_info.dart';
import 'package:cws_app/info_screens/feed_info.dart';
import 'package:cws_app/info_screens/employee_info.dart';
import 'package:flutter/material.dart';

class EmployeeInfoPage extends StatefulWidget {
  @override
  _EmployeeInfoPageState createState() => _EmployeeInfoPageState();
}

class _EmployeeInfoPageState extends State<EmployeeInfoPage> {

  int num = 0;
  final widgets = [FeedInfo(), EmployeeDashboard(), EmployeeInfo()];

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
          ],
          onTap: (a) {
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
