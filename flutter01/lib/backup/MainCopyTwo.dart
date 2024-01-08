import 'package:flutter/material.dart';

void main() {
  runApp(Text(
    'Hello World',
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(fontWeight: FontWeight.bold),
  ));
}
