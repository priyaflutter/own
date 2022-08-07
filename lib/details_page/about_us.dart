import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
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
        title: Text("About Us"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5,top: 15),
        child: Text("About Us",
            style: GoogleFonts.montserrat(
              fontSize:13,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
