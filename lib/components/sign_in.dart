import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const SignIn({super.key, required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
        borderRadius: BorderRadius.circular(50)  
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight:FontWeight.w700,
              ),
      
            ),
          
        ),
      ),
    );
  }
}