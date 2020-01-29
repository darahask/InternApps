import 'package:flutter/material.dart';

class CompleteInfo extends StatefulWidget {
  @override
  _CompleteInfoState createState() => _CompleteInfoState();
}

class _CompleteInfoState extends State<CompleteInfo> {
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
                        'Total Completed Projects- ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                CompleteContainer(),
                CompleteContainer(),
                CompleteContainer(),
                CompleteContainer(),
                CompleteContainer(),
                CompleteContainer(),
                CompleteContainer(),
                CompleteContainer(),
                CompleteContainer(),

              ]
            ),
          )
        ],
      ),
    );
  }
}

class CompleteContainer extends StatelessWidget {
  const CompleteContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  Text('Date of completion')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
