import 'package:cws_app/client_classes/cstatus_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusInfo extends StatefulWidget {
  @override
  _StatusInfoState createState() => _StatusInfoState();
}

class _StatusInfoState extends State<StatusInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            'Working Status',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Color(0xff034198),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                      ),
                    ],
                  ),
                ),
                StatusContainer(),
                StatusContainer(),
                StatusContainer(),
                StatusContainer(),
                StatusContainer(),
                StatusContainer(),
                StatusContainer(),
                StatusContainer(),
                StatusContainer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatusContainer extends StatelessWidget {
  const StatusContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ClientStatus()));
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[2],
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Image(
                  image: AssetImage('images/darklogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Application Name (Client Name)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LinearProgressIndicator(
                              value: 0.75,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                      Color(0xff034198)),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LinearProgressIndicator(
                              value: 0.75,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                      Color(0xff09a5e0)),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('Under Development')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
