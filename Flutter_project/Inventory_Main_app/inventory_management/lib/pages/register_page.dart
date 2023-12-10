import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/components/square_tile.dart';
import 'package:inventory_management/components/ui_textfield.dart';
import 'package:inventory_management/services/auth_services.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;


  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bgColor = Colors.black;


  // Sign user in method
  void signUserUp() async {

    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
          );
      }, 
    );

    // try creating the user
    try{
      // check if password is confimed
       if(passwordController.text == confirmPasswordController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
       }
       // passwords don't match
       else {
        // show error message, passwords don't match
        errorMessage('Passwords don\'t match');
       }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch(e) {

      // pop the loading circle
      Navigator.pop(context);
      //print('Error is here:'+e.code);
      if(e.code == 'INVALID_LOGIN_CREDENTIALS') {
        errorMessage('Invalid credentials, please check and try again.');
      }
      else if(e.code == 'channel-error'){
        errorMessage('Enter credentials to login and try again.');
      }
      else{
        errorMessage('Enter credentials to login and try again.');
      }
    }
  }

  // wrong email message popup

  void errorMessage(String message) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Text(
              message, 
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
             ),
            ),
          ),
        );
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,

      // AppBar 
      appBar: AppBar(
        leading: null, 

        backgroundColor: bgColor,
        elevation: 0,
        title: const Text('Sign Up'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),

      // login area
      body:SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                const SizedBox(height: 30),
            
                // logo
                const Icon(Icons.lock,
                size: 100,
                color: Colors.white,
                ),
              
                const SizedBox(height: 25),
              
                // Welcome back
                const Text('Create New Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                
                const SizedBox(height: 20),
            
                // username textfield
                TextFieldUI(
                  controller: emailController,
                  hintText: 'Email Address',
                  obscureText: false,
                  ),
            
                const SizedBox(height: 10),
                // password textfield
                TextFieldUI(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  ),
            
                const SizedBox(height: 10),
            
                // Confirm Password textfield
                TextFieldUI(
                  controller: confirmPasswordController,
                  hintText: 'Password',
                  obscureText: true,
                  ),
            
                const SizedBox(height: 10),
            
                const SizedBox(height:10),
            
                Container(
                  alignment: const Alignment(0,0.85),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                    onPressed: signUserUp ,
                    style: ButtonStyle(
                      foregroundColor: getColor(Colors.black, Colors.grey.shade800),
                      backgroundColor: getColor(Colors.white, Colors.grey.shade400),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))
                      ),
                    child: const Text('SIGN UP', style:  TextStyle(fontSize: 17),)
                    )
                    ),
                  ),
               
                const SizedBox(height: 30,),
            
                // or continue with 
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[200],
                        )
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal:10.0),
                        child: Text('Or continue with',
                          style: TextStyle(color: Colors.grey,),
                          ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 30),
            
                // google + apple + microsoft sign in buttons
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png',
                      ),
            
                    const SizedBox(width: 10),
                    
                    //apple button
                    SquareTile(
                      onTap: () {},
                      imagePath: 'lib/images/apple.png'
                      ),
                  ],
                ),
            
                const SizedBox(height: 40),
            
                // Not a member? register now
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an Account?',
                      style: TextStyle(
                        color: Colors.white,
                      )
                    ),
                    // Register now
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                  ],
                ),
              
              const SizedBox(height: 40),
              ]
                      ),
            ),
        ),
      ),
      )
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


