import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class support extends StatefulWidget {
  const support({Key? key}) : super(key: key);

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Support"),
      ),
      body: Column(
        children: [
          Container(
              height: theight * 0.36,
              padding: EdgeInsets.all(theight * 0.02),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Image.asset(
                    "images/launcher_logo.png",
                    height: theight * 0.15,
                  )),
                  SizedBox(
                    height: theight * 0.01,
                  ),
                  Text("Contact 24 X 7 Help",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("Our team will help solve you problem",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  Row(
                    children: [
                      Image.asset("images/call.png", height: theight * 0.03),
                      Text(" 9999999999",
                          style: GoogleFonts.montserrat(
                              color: Color(0xffda9e41),
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              )),
          Divider(
            thickness: 2,
          ),
          Expanded(flex: 2,
            child: Container(
              alignment: Alignment.topRight,
                  padding: EdgeInsets.all(theight * 0.02),
                decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                children: [
                  Expanded(flex: 2,
                    child: Container(
                      height: theight * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Have a question? Ask Now",
                              style: GoogleFonts.montserrat(
                                fontSize:22,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              "Our community member can help answer your question",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, color: Colors.grey)),
                          Text("ask now",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                  color: Color(0xffda9e41),
                                  fontWeight: FontWeight.bold

                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: theight * 0.25,
                    alignment: Alignment.center,
                      child: Image.asset("images/fb_img.png",
                          height:theight*0.12,)),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
