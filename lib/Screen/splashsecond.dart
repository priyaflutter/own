import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/login_page.dart';

class splash222 extends StatefulWidget {
  const splash222({Key? key}) : super(key: key);

  @override
  State<splash222> createState() => _splash222State();
}

class _splash222State extends State<splash222> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          height: theight,
          width: twidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/bgnew.png"),
            ),
          ),
          child: Container(
      height: theight,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/bgnew.png"),
          ),
      ),
      child: Column(
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: theight*0.15,),
            GestureDetector( onTap: () {
              Navigator.pop(context);
            },
              child: Container(
                height: theight*0.06,
                alignment: Alignment.topRight,
                margin: EdgeInsets.all(theight*0.01),
                padding: EdgeInsets.all(theight*0.01),
                decoration: BoxDecoration(color: Color(0xd2312f2f)),
                child: Center(
                  child: Text(
                    "➞ Skip it now",
                    style: TextStyle(
                        fontSize: theight * 0.02,
                        color: Colors.white,
                      fontWeight: FontWeight.bold
                        ),
                  ),
                ),
              ),
            ),
          ],
            ),
            SizedBox(height: theight*0.10,),
            Container(
          height: theight * 0.30,
          // width: double.infinity,
          child: Center(
              child: Image.asset(
            "images/launcher_logo.png",
            height: theight * 0.25,
          )),
            ),
            Spacer(),
            GestureDetector( onTap: () {
              Navigator.pop(context);
            },

          child: Container(
              height: theight * 0.07,
              width: double.infinity,
              margin: EdgeInsets.all(theight * 0.02),
              decoration: BoxDecoration(
                  color: Color(0xffda9e41),
                  borderRadius:
                      BorderRadius.all(Radius.circular(theight * 0.01))),
              child: Center(
                child: Text(
                  "GET STARTED",
                    style: GoogleFonts.montserrat(
                      fontSize: theight * 0.03,
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                ),
              )),
            ),
            SizedBox(
          height: theight * 0.02,
            ),
            Padding(
          padding: EdgeInsets.all(theight * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                  style: GoogleFonts.montserrat(
                    fontSize: theight * 0.02,
                    // color: Color(0xffbd7c1e),
                    color: Colors.white,
                  )
              ),
              GestureDetector(
                onTap: () {
                  print("Login");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return login();
                    },
                  ));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: theight * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
            ),
          ],
      ),
    ),
        ));
  }
}
