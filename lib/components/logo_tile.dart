import 'package:flutter/material.dart';

class LogoTile extends StatelessWidget {
  final String logoPath;
  final Function()? onTap;
   const LogoTile({super.key,
  required this.logoPath,
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey.shade300),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[100],
        ),
        child: Image.asset(
          logoPath,
          height: 40,
          ),
      
      ),
    );
  }
}