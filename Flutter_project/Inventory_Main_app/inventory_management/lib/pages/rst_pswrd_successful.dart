import 'package:flutter/material.dart';
import 'package:inventory_management/pages/login_or_register_page.dart';


class ResetPasswordSuccessful extends StatelessWidget{
  ResetPasswordSuccessful({super.key});
  
  final Color bgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,

      // AppBar 
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ), 

        backgroundColor: bgColor,
        elevation: 0,
        title: const Text('Reset Password'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: 350.0,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 50),
                child: Column(
          
                children: [
                  const Text(
                    'Your password has been sucessfully changed.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  
                  const SizedBox(height:50),
          
                  SizedBox(
                      height:50,
                      width:200,
                      child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPageOrRegister()),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor: getColor(Colors.black, Colors.grey.shade800),
                        backgroundColor: getColor(Colors.white, Colors.grey.shade400),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ))
                        ),
                      child: const Text('Login Now', style:  TextStyle(fontSize: 17),)
                      ),
                    ),
          
                ],
              )
            ),
          )
        ),

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