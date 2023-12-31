import 'package:flutter/material.dart';
import 'package:inventory_management/pages/intro_page_1.dart';
import 'package:inventory_management/pages/intro_page_2.dart';
import 'package:inventory_management/pages/login_or_register_page.dart';
import 'package:inventory_management/components/ui_mybutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


// ignore: camel_case_types
class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingScreenState createState() => _OnBoardingScreenState();  
}

class _OnBoardingScreenState extends State<onBoardingScreen> {

  // controller to keep track of the current page
  final PageController _controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
           PageView(
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
            ],
          ),

          //dot indicators
         Container(
          alignment:  const Alignment(0,-0.775), 
          // ranges between +1 and -1 with (0,0) being the center of screen, +ve on the bottom and -ve on the top
          child:  SmoothPageIndicator(controller: _controller, count: 2, effect: const ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.black,
          ),),
         ),

        // GET STARTED button
        MyButton(
          nextPage: const LoginPageOrRegister(),
          buttonText: 'GET STARTED',
          fgColor: Colors.white,
          fgColorPressed: Colors.grey.shade800,
          bgColor: Colors.black,
          bgColorPressed: Colors.grey.shade400,),
        ],
      ),
    );
  }
}