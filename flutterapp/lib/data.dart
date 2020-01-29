import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MyModel extends ChangeNotifier{

  int count = 0;

  void increment(){
    count++;
    notifyListeners();
  }

  void decrement(){
    count--;
    notifyListeners();
  }
  
}
