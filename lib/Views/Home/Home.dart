



import 'package:flutter/material.dart';
import 'package:nda_konek/WidgetsReusable/customFeatureeCards.dart';
import 'package:nda_konek/WidgetsReusable/customText.dart';

class Home extends StatefulWidget {
    const Home ({super.key});

    @override

  State<Home> createState() =>  HomeState();


}

class HomeState extends State<Home> {

  final TextEditingController searchFieldController = TextEditingController();


   List seeAll = [
      'Full time',
      'Part-Time',
      'Design',
      'Remote',
      'Near me',
      'Sales',
      'Development',
      'Others',
   ];




  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
      final height = size.height;
      final width = size.width;

    return Material(
        child: Padding(padding: EdgeInsets.symmetric(vertical: height * 0.030 ,horizontal: width * 0.05),
        child: Column(
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 
                  children: [
                    customizableText(text: 'Welcome to konek',fontweight: FontWeight.normal,color: Colors.blueGrey,size: 14),
                    customizableText(text: 'Tyang Amy! 👋 ',fontweight: FontWeight.normal,color: Colors.blueGrey,size: 14)
                  ],
                ),
                 Image.asset('assets/nda_logo.png',height: 50,width: 50,)
              ],
            ),
            TextField(
              controller: searchFieldController ,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                hintText: 'Search by job, Skill ,companies',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.slideshow)

              ),
            ),

            SizedBox(height: height * 0.01,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
              children: [
                  customizableText(text: 'Featured Jobs', color: Colors.black, fontweight: FontWeight.bold, size: 16),
                  TextButton(onPressed: (){}, child: customizableText(text: 'See All', color: Colors.black, fontweight: FontWeight.normal, size: 14))
              ],
            ),

            SizedBox(height: height * 0.005,),

            SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SizedBox(
                      height: 180,
                      width: 280, // Set card width so layout is stable
                      child: featuredCard(
                        logo: Image.asset('assets/nda_logo.png'),
                        role: 'UI Designer',
                        company: 'Facebook',
                        roleTypes: ['Full time', 'Design', 'Junior'],
                        priceRange: 35000,
                        location: 'Carmona, Cavite',
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),




          ],
        ),)
    );
  }
}