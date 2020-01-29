import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessagesInfo extends StatefulWidget {
  @override
  _MessagesInfoState createState() => _MessagesInfoState();
}

class _MessagesInfoState extends State<MessagesInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Messages',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Color(0xff034198),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    'Message from Client',
                    style: TextStyle(
                        color: Color(0xff09a5e0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Message(),
                Message(),
                Message(),
                Divider(
                  color: Color(0xff034198),
                  thickness: 3,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Message from Employee',
                      style: TextStyle(
                          color: Color(0xff09a5e0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
                Message(),
                Message(),
                Message(),
                Message(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        decoration:
            BoxDecoration(boxShadow: kElevationToShadow[2], color: Colors.white),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.person,
              color: Colors.black,
              size: 60,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Active now',
                      ),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      'How much amount',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
