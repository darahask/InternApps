import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Working Departmant',style: TextStyle(color: Color(0xff034198),fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            builder(),
            builder(),
            builder(),
            builder(),
            builder(),
            builder(),
            builder(),
          ],
        ),
      ),
    );
  }

  Widget builder(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(Icons.person_pin,size: 80,),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),
                Text(
                  'ID.NO:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Text(
                  'D.O.B:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Text(
                  'E-Mail Id:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Text(
                  'Joining Date:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}