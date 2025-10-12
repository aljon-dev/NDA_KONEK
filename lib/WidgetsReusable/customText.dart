

import 'package:flutter/material.dart';

Widget customizableText({
  required String text,
  required Color color,
  required FontWeight fontweight,
  required double size,

}) {
  return Text(
    text,style: TextStyle(
      color:color,
      fontWeight: fontweight,
      fontSize: size,
    ),
  );
} 