import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page_1/components/logo_tile.dart';
import 'package:login_page_1/components/sign_in.dart';
import 'package:login_page_1/components/textfields.dart';
import 'package:login_page_1/services/auth_signin.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;
    Loginpage({super.key,required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  //Controllers
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

void signUser() async{

  //Loading Circle
  showDialog(
    context: context, 
    builder: (context){
      return Center(child: CircularProgressIndicator(),
      );
    },
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _passController.text.trim(),
    );
     //pop Loading Circle
    Navigator.pop(context);
  }
  on FirebaseAuthException catch(e) {
     //pop Loading Circle
    Navigator.pop(context);
    showErrorMessage(e.code);
  }
}
   
void showErrorMessage(String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(  
        title: Center(child: Text(
          message,
          ),),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
            
                //LOGO
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('lib/images/Hello.gif'),
                ),

                //SizedBox(height: 50,),
            
                //Welcome Back
                Text(
                  "Welcome back . You've been missed !",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600]),
                  ),
                   SizedBox(height: 50,),
            
                //Login
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Mono'
                    )
                    ),
                ), 
                SizedBox(height: 20,),
            
                //Username Textfield
                MyTextField(
                  controller: _emailController,
                  hintText: 'Username',
                  obscureText: false,
            
                ),
               
                SizedBox(height: 15),
              
                // Password Textfield
                MyTextField(
                  controller: _passController,
                  hintText: 'Password',
                  obscureText: true,
            
                ),
                
                SizedBox(height: 20,),
            
                //Forgot Password
                Align(
                  child: Padding(
                    padding: EdgeInsetsGeometry.directional(start: 250),
                    child: Text(
                      "Forgot Password?",
                    ),
                  ),
                ),
                SizedBox(height: 10,),
            
                //Sign In Button
                SignIn(
                  text:"Sign in",
                  onTap: signUser,
                ),
            
                // or Continue
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0),
                        child: Text("Or continue using"),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],),
                      ),
                    ],
                  ),
                ),
            
                //Google + Apple Signin Buttons
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LogoTile(
                        onTap: () => AuthServices().signinWithGoogle(),
                        logoPath: 'lib/images/google.png'),
                      LogoTile(
                        onTap: () {},
                        logoPath: 'lib/images/apple.png'),
                    ],
                  ),
                ),
            
                //Register if Not Member
                Center(
                  child: Row(
                     mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text("Not a member?",),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register now ?",
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w500
                            ) 
                        ),
                      ),
                    ],
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}