

import 'package:flutter/material.dart';
import 'package:nda_konek/WidgetsReusable/Customcolors.dart';
import 'package:nda_konek/WidgetsReusable/customForm.dart';
import 'package:nda_konek/WidgetsReusable/customText.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

 
@override  State<ResetPassword> createState() => _ResetPasswordState();

}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.width;
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customizableText(text: 'Reset your password', color: Colors.black, fontweight: FontWeight.bold, size: 30),
          customizableText(text: 'Kindly enter your email and we will send an OTP code in the next step to reset your password.', color: Colors.blueGrey, fontweight: FontWeight.normal, size: 16),

          SizedBox(height: height * 0.05,),

          CustomFormField(title: 'Email Address', controllerName: emailController, hintText: 'eg: johndoe@gmail.com', type: TextInputType.text, icon: Icon(Icons.email)),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: CustomColors.sunsetGradientCustom
            ),
            
            margin: EdgeInsets.only(top: height * 1.00),
            child: ElevatedButton(
              onPressed: () {
                // Handle send OTP action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: customizableText(text: 'Send OTP', color: Colors.white, fontweight: FontWeight.bold, size: 16),
            ),
          )

        ],
      ),)
    );
  }
}