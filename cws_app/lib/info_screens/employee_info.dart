import 'package:cws_app/info_screens/employee_details.dart';
import 'package:flutter/material.dart';

class EmployeeInfo extends StatefulWidget {
  @override
  _EmployeeInfoState createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {
  var list = [
    'Graphic Designing',
    'Development',
    'Digital Marketing',
    'Total Employee',
    'Website Maintainance',
    'Executive Manager'
  ];
  var cList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.blue,
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Employee Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xff034198),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                height: 10,
              ),
            ],),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.3,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeDetails()));
                  },
                  child: GridChild(
                    text: list[index],
                    color: cList[index],
                  ),
                );
              },
              childCount: 6,
            ),
          )
        ],
      ),
    );
  }
}

class GridChild extends StatelessWidget {
  final text, color;

  GridChild({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
