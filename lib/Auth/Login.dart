


import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as customColors;
import 'package:nda_konek/Auth/Register.dart';
import 'package:nda_konek/Auth/Resetpassword.dart';
import 'package:nda_konek/Views/Home/Home.dart';
import 'package:nda_konek/WidgetsReusable/Customcolors.dart';
import 'package:nda_konek/WidgetsReusable/customForm.dart';
import 'package:nda_konek/WidgetsReusable/customFormPassword.dart';
import 'package:nda_konek/WidgetsReusable/customText.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
    const Login ({super.key});



    @override
    State<Login> createState () => LoginState();
}


class LoginState extends State<Login> {


  final _supabase = Supabase.instance;

   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
  
  bool rememberMe = false;


    Future<void> loginUser () async {


        try{
          await _supabase.client.auth.signInWithPassword(
          email: emailController.text,
          password: passwordController.text);

        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Login',style: TextStyle(
          color: Colors.white
        ),),backgroundColor: Colors.green,behavior:SnackBarBehavior.floating,));

        }catch(e){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),style: TextStyle(
          color: Colors.white
        ),),backgroundColor: Colors.red,behavior:SnackBarBehavior.floating,));


        }
        


    }

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
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset('assets/nda_logo.png',height: 100,width: 50,),
          customizableText(text: 'Welcome Back', color: Colors.black, fontweight: FontWeight.bold, size:20),
          customizableText(text: 'We are happy to see you again, Enter your email and password to get started', color: Colors.blueGrey, fontweight: FontWeight.w500, size:16),
          
          SizedBox(height: height * 0.025,),

        CustomFormField(
            title: 'Email',
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

          SizedBox(height: height * 0.005,),

          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          Row(
            
          children: [
          Checkbox(value:rememberMe , onChanged: (value){
            setState(() {
              rememberMe = value!;
              });
            }),
          customizableText(text: 'Remember Me ', color: Colors.black, fontweight: FontWeight.normal, size: 14)
          ],
         ),
        
         TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPassword()));
         }, child:     customizableText(text: 'Forgot password? ', color: Colors.pink, fontweight: FontWeight.normal, size: 14))

        ],
      ),
          SizedBox(width: double.infinity, child: Container(
          decoration: BoxDecoration(
            gradient: CustomColors.sunsetGradientCustom,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
          onPressed: () {
           loginUser();
          },
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
         ),
       ),
      child: customizableText(text: 'Sign In', color: Colors.white, fontweight: FontWeight.bold, size: 20)),
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

      customizableText(text: 'Dont`t have an account? ', color: Colors.blueGrey, fontweight: FontWeight.w400, size: 16),
      
      TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
      }, child:   customizableText(text: 'Sign up here ', color: Colors.pink, fontweight: FontWeight.bold, size: 16))

    ],)



        ],
      ),)
    );
  }
}