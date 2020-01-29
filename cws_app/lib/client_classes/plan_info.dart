import 'package:flutter/material.dart';

class OurPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Image(
          image: AssetImage('images/rsz_p2.png',),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
