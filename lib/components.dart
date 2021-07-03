import 'package:flutter/material.dart';

Icon printIcone(Color color, IconData icon) {
  return Icon(
    icon,
    color: color,
  );
}

Text printAnswe(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
    ),
  );
}
