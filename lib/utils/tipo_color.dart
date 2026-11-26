import 'package:flutter/material.dart';

Color colorDeTipo(String tipo) {
  switch (tipo) {
    case 'fire':
      return Colors.red;
    case 'water':
      return Colors.blue;
    case 'grass':
      return Colors.green;
    case 'electric':
      return Colors.amber;
    case 'poison':
      return Colors.purple;
    case 'flying':
      return Colors.lightBlue;
    case 'bug':
      return Colors.lightGreen;
    case 'ground':
      return Colors.brown;
    default:
      return Colors.grey;
  }
}