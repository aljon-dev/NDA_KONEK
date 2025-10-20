



import 'package:flutter/material.dart';
import 'package:nda_konek/Auth/Login.dart';
import 'package:nda_konek/Auth/Otp.dart';
import 'package:nda_konek/WidgetsReusable/Customcolors.dart';
import 'package:nda_konek/WidgetsReusable/customForm.dart';
import 'package:nda_konek/WidgetsReusable/customFormPassword.dart';
import 'package:nda_konek/WidgetsReusable/customText.dart';

class Register extends StatefulWidget{

    const Register ({super.key});


    @override  

    State<Register> createState () => registerState();

    


}

class registerState extends State<Register>{
   final TextEditingController  nameController= TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();
  
  bool isAgree = false;

  List <Map<String,dynamic>> loginOptions = [
    {
      'name':'Google',
      'icon':'assets/nda_logo.png'
    },
    {
      'name':'Facebook',
      'icon':'assets/nda_logo.png'
    },
    {
      'name':'Apple',
      'icon':'assets/nda_logo.png'
    }

  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset('assets/nda_logo.png',height: 100,width: 50,),
          customizableText(text: 'Welcome Back', color: Colors.black, fontweight: FontWeight.bold, size:20),
          customizableText(text: 'We are happy to see you again, Enter your email and password to get started', color: Colors.blueGrey, fontweight: FontWeight.w500, size:16),
          
  SizedBox(height: height * 0.025,),

           CustomFormField(
            title: 'Name',
            controllerName: emailController, 
            hintText: 'Eg: John Doe', 
            type: TextInputType.text,
            icon: Icon(Icons.email_outlined)),

          SizedBox(height: height * 0.025,),

        CustomFormField(
            title: 'Email Address',
            controllerName: emailController, 
            hintText: 'Eg: JohnDoe@gmail.com', 
            type: TextInputType.text,
            icon: Icon(Icons.email_outlined)),

        SizedBox(height: height * 0.025,),

        CustomFormPasswordField(
          title: 'Password', 
          controllerName: passwordController ,
          hintText: '*****', 
          type: TextInputType.text,
          prefixIcon: Icon(Icons.lock_rounded)),

          CustomFormPasswordField(
          title: 'Confirm Password', 
          controllerName: passwordController ,
          hintText: '*****', 
          type: TextInputType.text,
          prefixIcon: Icon(Icons.lock_rounded)),

          SizedBox(height: height * 0.015,),

              Row(
      
      children: [

       Checkbox(value: isAgree, onChanged: (bool? value){
        setState(() {
           isAgree = value!;
        });
       }) ,

      customizableText(text: 'Agree with ', color: Colors.blueGrey, fontweight: FontWeight.w400, size: 16),
      
      customizableText(text: 'Terms & Conditions  ', color: Colors.pink, fontweight: FontWeight.bold, size: 16)

    ],),


    SizedBox(width: double.infinity, child: Container(
          decoration: BoxDecoration(
            gradient: CustomColors.sunsetGradientCustom,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPVerificationScreen()));
          },
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
         ),
       ),
      child: customizableText(text: 'Sign Up', color: Colors.white, fontweight: FontWeight.bold, size: 20)),
      ),
    ),

     SizedBox(height: height * 0.035,),


      Row(
      children: [
        const Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 3,
          endIndent: 10,
        ),
      ),
      customizableText(text: 'Or', color: Colors.blueGrey, fontweight: FontWeight.normal, size: 14),
        const Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 3,
          indent: 10,
        ),
      ),
    ],
    ),
      SizedBox(height: height * 0.035,),
    
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(loginOptions.length, (index) {
        final logos = loginOptions[index];
        return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0), // 👈 adds gap
        child: ClipOval(
          child: Container(
          height: 60,
          width: 60,
           decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(logos['icon'], fit: BoxFit.contain),
            ),
          ),
        ),
      );
    }),
    ),

    SizedBox(height: height * 0.035,),

    
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      customizableText(text: 'Already have an account? ', color: Colors.blueGrey, fontweight: FontWeight.w400, size: 16),
      
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child:   customizableText(text: 'Sign in here ', color: Colors.pink, fontweight: FontWeight.bold, size: 16))

    ],)

  


        ],
      ),),)
    );
  }
}

