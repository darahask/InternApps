import 'package:flutter/material.dart';

class ClientMessages extends StatefulWidget {
  @override
  _ClientMessagesState createState() => _ClientMessagesState();
}

class _ClientMessagesState extends State<ClientMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
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
          SizedBox(
            height: 4,
          ),
          Message(),
          Expanded(child: Text(''),),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[8],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xff09a5e0), Color(0xff034198)],
                ),
              ),
              child: Center(
                child: Text(
                  'Message CEO',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      )
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
                        'OtherAdmin',
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
