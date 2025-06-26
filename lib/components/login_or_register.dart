import 'package:flutter/material.dart';
import 'package:login_page_1/pages/loginpage.dart';
import 'register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool showLogin = true;

void togglepages() {
    setState(() 
    {
      showLogin = !showLogin;
    });
}

  @override
  Widget build(BuildContext context) {
    if(showLogin){
      return Loginpage(
        onTap: togglepages,);
    } 
    else{
      return Registerpage(
        onTap: togglepages,
      );
    }
  }
}