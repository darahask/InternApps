import 'package:cws_app/info_page.dart';
import 'package:flutter/material.dart';

class AdminSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff09a5e0), Color(0xff034198)],
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InfoMain(state:1)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(150),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10),),
                      ),
                      child: Center(child: Text('Over all Admin',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InfoMain(state:0)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(150),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10),),
                      ),
                      child: Center(child: Text('Development Department Admin',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InfoMain(state:0)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(150),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10),),
                      ),
                      child: Center(child: Text('Designing Department Admin',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    height: MediaQuery.of(context).size.height / 3.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                        boxShadow: kElevationToShadow[8]),
                    child: Center(
                      child: Image(
                        width: MediaQuery.of(context).size.width / 1.7,
                        image: AssetImage('images/darklogo.png'),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InfoMain(state:1)));
                    },
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
