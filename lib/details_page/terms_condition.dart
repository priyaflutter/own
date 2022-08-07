import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class terms extends StatefulWidget {
  const terms({Key? key}) : super(key: key);

  @override
  State<terms> createState() => _termsState();
}

class _termsState extends State<terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Terms & Conditions"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5,top: 15),
        child: Text("Terms & Conditions :",
            style: GoogleFonts.montserrat(
              fontSize:13,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
