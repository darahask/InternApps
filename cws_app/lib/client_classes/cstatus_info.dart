import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'ClickBata(Emmanueal)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color(0xff034198),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Pack He Selected',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StatusContainer(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: kElevationToShadow[2],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.phone,
                                        size: 60,
                                      )),
                                  Expanded(
                                    child: Text(
                                      'Call',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: kElevationToShadow[2],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.message,
                                        size: 60,
                                      )),
                                  Expanded(
                                    child: Text(
                                      'Call',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'UI Design',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              colors: [Color(0xff09a5e0), Color(0xff034198)],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Completed',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image(
                    image: AssetImage('images/rsz_2p1.png'),
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            )
          ],
        ),
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
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 90,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LinearProgressIndicator(
                            value: 0.75,
                            valueColor: AlwaysStoppedAnimation<Color>(
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff09a5e0)),
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Process-75%'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Payment-75%'),
                        ),
                      )
                    ],
                  ),
                  Text('Under Development')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
