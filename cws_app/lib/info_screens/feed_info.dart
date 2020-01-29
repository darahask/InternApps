import 'package:flutter/material.dart';

class FeedInfo extends StatefulWidget {
  @override
  _FeedInfoState createState() => _FeedInfoState();
}

class _FeedInfoState extends State<FeedInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('images/imgfeed1.png'),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10),),
                          gradient:LinearGradient(
                            colors: [Color(0xff09a5e0), Color(0xff034198)],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Get in touch with us...',style: TextStyle(color: Colors.white,fontSize: 18),),
                            Text('2 hours ago',style: TextStyle(color: Colors.white,fontSize: 18),),
                            Icon(Icons.favorite,color: Colors.white,),
                            Icon(Icons.message,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('images/imgfeed2.png'),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10),),
                          gradient:LinearGradient(
                            colors: [Color(0xff09a5e0), Color(0xff034198)],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Get in touch with us...',style: TextStyle(color: Colors.white,fontSize: 18),),
                            Text('2 hours ago',style: TextStyle(color: Colors.white,fontSize: 18),),
                            Icon(Icons.favorite,color: Colors.white,),
                            Icon(Icons.message,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('images/imgfeed1.png'),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10),),
                          gradient:LinearGradient(
                            colors: [Color(0xff09a5e0), Color(0xff034198)],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Get in touch with us...',style: TextStyle(color: Colors.white,fontSize: 18),),
                            Text('2 hours ago',style: TextStyle(color: Colors.white,fontSize: 18),),
                            Icon(Icons.favorite,color: Colors.white,),
                            Icon(Icons.message,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}

