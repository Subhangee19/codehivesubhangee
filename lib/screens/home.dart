import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Welcome To",
            style: TextStyle(
             fontSize: 30
            ),
          ),
        ),
        Text(
          "CodeHive!",
          style: GoogleFonts.caveatBrush(
              fontSize: 65,
              fontWeight: FontWeight.bold,
              color: Colors.orange
          ),
        )
      ],
    );
  }
}
