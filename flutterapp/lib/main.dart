import 'package:flutter/material.dart';
import 'package:flutterapp/data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Center(
        child: Consumer<MyModel>(
          builder: (context, model, widget) => Text(
            model.count.toString(),
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: Consumer<MyModel>(
        builder: (context, model, widget) => FloatingActionButton(
          onPressed: model.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
