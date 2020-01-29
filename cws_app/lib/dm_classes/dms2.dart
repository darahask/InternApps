import 'package:flutter/material.dart';

class DmTest extends StatefulWidget {
  @override
  _DmTestState createState() => _DmTestState();
}

class _DmTestState extends State<DmTest> {
  String s = 'Time Duration';
  var c = Color(0xff09a5e0);
  var c2 = Color(0xff034198);
  String dropdownValue = 'Course Title';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(
              'images/darklogo.png',
            ),
            height: 90,
            width: 190,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                'Test',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xff034198),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Select',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[4],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        underline: Container(color:Colors.white),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Course Title', 'Digital Marketing']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        s = '0.01 s';
                        c = c2;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[4],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: c,
                      ),
                      child: Center(
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                s,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
