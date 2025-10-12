


import 'package:flutter/material.dart';

class CustomColors {

    static const Color hotPink = Color(0xFFFF007F);
    static const Color orangeRed = Color(0xFFFF4F00);


    static const LinearGradient sunsetGradient = LinearGradient(colors: [hotPink,orangeRed]);


    static const LinearGradient sunsetGradientCustom = LinearGradient(
      colors: [hotPink,orangeRed],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      );


}