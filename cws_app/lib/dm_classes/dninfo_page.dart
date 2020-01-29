import 'package:cws_app/dm_classes/dms1.dart';
import 'package:cws_app/dm_classes/dms2.dart';
import 'package:flutter/material.dart';

class DmInfoPage extends StatefulWidget {
  @override
  _DmInfoPageState createState() => _DmInfoPageState();
}

class _DmInfoPageState extends State<DmInfoPage> {
  int num = 0;
  final widgets = [DmHome(), DmTest()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widgets[num],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                'Home',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
              ),
              title: Text(
                'Test',
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
