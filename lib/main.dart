import 'package:flutter/material.dart';
import 'package:nda_konek/Auth/Login.dart';
import 'package:nda_konek/WidgetsReusable/customText.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

 
  runApp(const  MyApp());

   WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
    url:'https://wvagjowvktijocapfloe.supabase.co',
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind2YWdqb3d2a3Rpam9jYXBmbG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE4Mjg2OTMsImV4cCI6MjA3NzQwNDY5M30.ic_r_v8qcBTUtJw7wnH51oH1Z3cZHfjlynAPZIDzMv4'
  );



}



class MyApp extends StatelessWidget{
    const MyApp({super.key});
    
      @override
      Widget build(BuildContext context) {
       return MaterialApp(home: SplashScreen(),);
    }

}

class SplashScreen extends StatefulWidget { 
    const SplashScreen ({super.key});

  @override   
  State<SplashScreen> createState () => SplashScreenState();
  

}

class SplashScreenState extends State<SplashScreen>{

 bool isSplashScreen = true;

 int selectedSteps  = 0;

 final List<Map<String,dynamic>> _headerTitle = [
    {
      'image':'assets/logo1.jpg',
      'header':'Find Your Dream Job Here',
      'content':'Discover opportunities that makes your skills goals and lifestyle'
    },

      {
      'image':'assets/logo2.jpg',
      'header':'Your career,your way',
      'content':'Connect with top employers and take the next step in your journey.'
    },
    {
      'image':'assets/logo3.jpg',
      'header':'Swipe. Connect. Get hired.',
      'content':'Explore jobs and people like never before — fast, easy, and tailored to you.'
    }
  ] ;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds:  3)).then((_)=>{
      setState(() {
        isSplashScreen = false;
      })
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    
    return Material(
    child: Padding(padding: EdgeInsets.symmetric(horizontal: width * 0.055 ,vertical: height * 0.005 ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      isSplashScreen ?  Image.asset('assets/nda_logo.png') 
      :
      Column(
      children: List.generate(_headerTitle.length, (index){
        final headerTitle = _headerTitle[index];
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(selectedSteps == index)...[
            Image.asset(headerTitle['image']),
            const SizedBox(height: 10,),
            customizableText(text: headerTitle['header'], color: Colors.black, fontweight: FontWeight.bold, size: 20),
            SizedBox(height: 10,),
            customizableText(text: headerTitle['content'], color: Colors.blueGrey, fontweight: FontWeight.w400, size: 16),
            SizedBox(height: 5,),
            Row(
            children: List.generate(_headerTitle.length, (dotIndex){
              return Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                shape:BoxShape.circle,
                gradient: dotIndex == selectedSteps ? 
                const LinearGradient(colors: [Color(0xFFFF007F), Color(0xFFFF4F00) ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
                )
                :  
                const LinearGradient(colors:[ Colors.grey, Colors.grey])
              ),
            );
          }),
        ),
        SizedBox(height: height  * 0.2,),
        ]
      ],
      );
      }),
    ),
      isSplashScreen ? SizedBox.shrink() :  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
        }, child: customizableText(text: 'Skip', color: Colors.blueGrey, fontweight:FontWeight.w300, size: 16)),
        Container(
          height: 54,
          width: 54,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF007F),
                Color(0xFFFF4F00)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: ClipOval(
            child: IconButton(onPressed: (){
              setState(() {
                selectedSteps += 1;
              });
              if(selectedSteps == 3){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
              }
            }, icon: Icon(Icons.arrow_right_alt,size: 40,color: Colors.white,))
          ),
        )
      ],
      )
    ],
  ),
)
  );
  }
  
}