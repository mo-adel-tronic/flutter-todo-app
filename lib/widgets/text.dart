import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

Widget smallText(String data, {Color? color}) {
  return Text(data, style: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: color?? Colors.white
  ));
}

Container smallSpanText(String data) {
  return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: secColor,
            borderRadius: BorderRadius.circular(20)
          ),
          width: 20,
          height: 20,
          child: smallText(data),
        );
}