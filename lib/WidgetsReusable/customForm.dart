


import 'package:flutter/material.dart';

Widget CustomFormField ({
  required String title,
  required TextEditingController controllerName,
  required String hintText,
  required TextInputType type,
  required Icon icon,

}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(title,style: TextStyle(fontSize: 20),),
    const SizedBox(height: 5,),
    TextFormField(
      controller:controllerName, 
      keyboardType: type,

      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    )

      ],
    );
}