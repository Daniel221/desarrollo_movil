// ignore_for_file: prefer_final_fields, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class Contador with ChangeNotifier {
  int _count = 0;
  Color? _color = Colors.grey[200];
  Color? _textColor = Colors.black;
  int get count => _count;
  Color? get color => _color;
  Color? get textColor => _textColor;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void changeColor(color) {
    if (color == 'BLACK')
      _color = Colors.black87;
    else if (color == 'RED')
      _color = Colors.red;
    else if (color == 'BLUE')
      _color = Colors.blue;
    else if (color == 'GREEN') _color = Colors.green;
    _textColor = Colors.white;
    notifyListeners();
  }
}
