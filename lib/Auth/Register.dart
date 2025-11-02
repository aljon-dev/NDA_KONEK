import 'package:flutter/material.dart';
import 'package:nda_konek/Auth/Login.dart';
import 'package:nda_konek/Auth/Otp.dart';
import 'package:nda_konek/WidgetsReusable/Customcolors.dart';
import 'package:nda_konek/WidgetsReusable/customForm.dart';
import 'package:nda_konek/WidgetsReusable/customFormPassword.dart';
import 'package:nda_konek/WidgetsReusable/customText.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => registerState();
}

class registerState extends State<Register> {
  
  final Supabase _supabase = Supabase.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isAgree = false;
  bool isLoading = false;

  List<Map<String, dynamic>> loginOptions = [
    {'name': 'Google', 'icon': 'assets/nda_logo.png'},
    {'name': 'Facebook', 'icon': 'assets/nda_logo.png'},
    {'name': 'Apple', 'icon': 'assets/nda_logo.png'}
  ];

  Future<void> registerUser() async {
  

    if (!isAgree) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please agree the terms and condition',style: TextStyle(
          color: Colors.white
        ),),backgroundColor: Colors.red,behavior:SnackBarBehavior.floating,));
      return;
    }

    // Check password match
    if (passwordController.text != confirmPasswordController.text) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password not match',style: TextStyle(
          color: Colors.white
        ),),backgroundColor: Colors.red,behavior:SnackBarBehavior.floating,));
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await _supabase.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      final user = response.user;

      if(user != null) {
        String userid = user.id;

       await _supabase.client.from('users').insert({
          'name':nameController.text,
          'userid':userid,
          'profile':'',
        });

        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Registered',style: TextStyle(
          color: Colors.white
        ),),backgroundColor: Colors.green,behavior:SnackBarBehavior.floating,));

   

      
      }
      

      if (!mounted) return;

     
    } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),style: TextStyle(
          color: Colors.white
      ),),backgroundColor: Colors.red,behavior:SnackBarBehavior.floating,));

  
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),style: TextStyle(
          color: Colors.white
      ),),backgroundColor: Colors.red,behavior:SnackBarBehavior.floating,));

  
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/nda_logo.png', height: 100, width: 50),
                customizableText(
                  text: 'Create Account',
                  color: Colors.black,
                  fontweight: FontWeight.bold,
                  size: 20,
                ),
                customizableText(
                  text: 'Sign up to get started with NDA Konek',
                  color: Colors.blueGrey,
                  fontweight: FontWeight.w500,
                  size: 16,
                ),
                SizedBox(height: height * 0.025),

                // Name Field - FIXED: using nameController
                CustomFormField(
                  title: 'Name',
                  controllerName: nameController,
                  hintText: 'Eg: John Doe',
                  type: TextInputType.text,
                  icon: const Icon(Icons.person_outline),
                ),
                SizedBox(height: height * 0.025),

                // Email Field
                CustomFormField(
                  title: 'Email Address',
                  controllerName: emailController,
                  hintText: 'Eg: JohnDoe@gmail.com',
                  type: TextInputType.emailAddress,
                  icon: const Icon(Icons.email_outlined),
                ),
                SizedBox(height: height * 0.025),

                // Password Field
                CustomFormPasswordField(
                  title: 'Password',
                  controllerName: passwordController,
                  hintText: '*****',
                  type: TextInputType.text,
                  prefixIcon: const Icon(Icons.lock_rounded),
                ),
                SizedBox(height: height * 0.025),

                // Confirm Password Field - FIXED: using confirmPasswordController
                CustomFormPasswordField(
                  title: 'Confirm Password',
                  controllerName: confirmPasswordController,
                  hintText: '*****',
                  type: TextInputType.text,
                  prefixIcon: const Icon(Icons.lock_rounded),
                ),
                SizedBox(height: height * 0.015),

                // Terms Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: isAgree,
                      onChanged: (bool? value) {
                        setState(() {
                          isAgree = value!;
                        });
                      },
                    ),
                    customizableText(
                      text: 'Agree with ',
                      color: Colors.blueGrey,
                      fontweight: FontWeight.w400,
                      size: 16,
                    ),
                    customizableText(
                      text: 'Terms & Conditions',
                      color: Colors.pink,
                      fontweight: FontWeight.bold,
                      size: 16,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.025),

                // Sign Up Button with Loading State
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: CustomColors.sunsetGradientCustom,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: isLoading ? null : (){
                          // Validate form
                      if (formKey.currentState == null || !formKey.currentState!.validate()) {
                     
                        return;
                      }
                      registerUser();

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : customizableText(
                              text: 'Sign Up',
                              color: Colors.white,
                              fontweight: FontWeight.bold,
                              size: 20,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.035),

                // Divider
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 3,
                        endIndent: 10,
                      ),
                    ),
                    customizableText(
                      text: 'Or',
                      color: Colors.blueGrey,
                      fontweight: FontWeight.normal,
                      size: 14,
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 3,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.035),

                // Social Login Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(loginOptions.length, (index) {
                    final logos = loginOptions[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                SizedBox(height: height * 0.035),

                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customizableText(
                      text: 'Already have an account? ',
                      color: Colors.blueGrey,
                      fontweight: FontWeight.w400,
                      size: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: customizableText(
                        text: 'Sign in here',
                        color: Colors.pink,
                        fontweight: FontWeight.bold,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}