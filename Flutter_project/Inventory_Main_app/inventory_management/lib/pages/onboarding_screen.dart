import 'package:flutter/material.dart';
import 'package:inventory_management/pages/intro_page_1.dart';
import 'package:inventory_management/pages/intro_page_2.dart';
import 'package:inventory_management/pages/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

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
            children: [
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
         Container(
          alignment: const Alignment(0,0.85),
          child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            style: ButtonStyle(
              foregroundColor: getColor(Colors.white, Colors.black),
              backgroundColor: getColor(Colors.black, Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ))
              ),
            child: const Text('GET STARTED', style: TextStyle(fontSize: 17),)
            )
            ),
          )
        ],
      ),
    );
  }

    // Get color method
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      }
      else
      {
        return color;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }
}