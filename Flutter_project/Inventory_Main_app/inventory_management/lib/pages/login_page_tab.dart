import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/components/square_tile.dart';
import 'package:inventory_management/pages/forgot_password.dart';
import 'package:inventory_management/components/ui_textfield.dart';
import 'package:inventory_management/services/auth_services.dart';
import 'package:lottie/lottie.dart';


class LoginPageTab extends StatefulWidget {
  final Function()? onTap;


  const LoginPageTab({super.key, required this.onTap});

  @override
  State<LoginPageTab> createState() => _LoginPageTabState();
}

class _LoginPageTabState extends State<LoginPageTab> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bgColor = Colors.black;


  // Sign user in method
  void signUserIn() async {

    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
          );
      }, 
    );

    // try sign in
    try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch(e) {

      // pop the loading circle
      Navigator.pop(context);
      
      //print('Error is here:'+e.code);
      
      if(e.code == 'INVALID_LOGIN_CREDENTIALS') {
        invalidCredentialsMessage();
      }
      else if(e.code == 'channel-error'){
        enterCredentialsMessage();
      }
      else{
        errorMessage();
      }
    }
  }

  // wrong email message popup

  void invalidCredentialsMessage() {
    showDialog(context: context, builder: (context) {
      return const AlertDialog(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Invalid credentials, please check and try again.', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      );
    },);
  }

  // Enter credentials method
  void enterCredentialsMessage() {
    showDialog(context: context, builder: (context) {
      return const AlertDialog(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Enter credentials to login and try again.', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      );
    },);
  }

  // Error Message
  void errorMessage() {
    showDialog(context: context, builder: (context) {
      return const AlertDialog(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Error. Please try again later.', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      );
    },);
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
        title: const Text('Sign In'),

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
            child: Row(
              children: [
                Expanded(
                  flex:4,
                  child:Lottie.asset(
                    'lib/animations/inventory_management.json',
                    repeat: true,
                    fit: BoxFit.fill,
                  ),
                ),
                
                SizedBox(
                  width:450,
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
                          const Text('Welcome Back',
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
                          // forgot password?
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                                    );
                                    },
                                  style: ElevatedButton.styleFrom(
                                    splashFactory: NoSplash.splashFactory,
                                    foregroundColor:Colors.white,
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text('Forgot Your Password?'),
                                )
                              ],
                            ), 
                          ),
                    
                          const SizedBox(height:10),
                    
                          // sign in button
                          /*MyButtonUI(
                            onTap: signUserIn,
                            ),
                          */
                          Container(
                            alignment: const Alignment(0,0.85),
                            child: SizedBox(
                              height: 50,
                              width: 200,
                              child: ElevatedButton(
                              onPressed: signUserIn ,
                              style: ButtonStyle(
                                foregroundColor: getColor(Colors.black, Colors.grey.shade800),
                                backgroundColor: getColor(Colors.white, Colors.grey.shade400),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ))
                                ),
                              child: const Text('SIGN IN', style:  TextStyle(fontSize: 17),)
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
                                onTap: () => AuthService().signInWithGoogle() ,
                                imagePath: 'lib/images/google.png'),
                    
                              const SizedBox(width: 10),
                              
                              //apple button
                              SquareTile(
                                onTap: () {},
                                imagePath: 'lib/images/apple.png'),
                            ],
                          ),
                    
                          const SizedBox(height: 40),
                    
                          // Not a member? register now
                    
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an Account?',
                                style: TextStyle(
                                  color: Colors.white,
                                )
                              ),
                              // Register now
                              GestureDetector(
                                onTap: widget.onTap,
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                              ),
                            ],
                          )  
                        ]
                        ),
                  ),
              ],
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


