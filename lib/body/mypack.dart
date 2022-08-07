import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/body/Homepage.dart';

class mypack extends StatefulWidget {
  const mypack({Key? key}) : super(key: key);

  @override
  State<mypack> createState() => _mypackState();
}

class _mypackState extends State<mypack> {


  bool internet_status = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setConnectionCheck(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(  backgroundColor: Colors.black,
          title: Text("My Package", style: GoogleFonts.montserrat()),
          centerTitle: true,
          leading: GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {

                  return home();
            },));
          },
              child: Icon(Icons.arrow_back_rounded)),
          actions: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Positioned(
                  top: 5,
                  child: Container(
                    width: twidth * 0.05,
                    child: Center(
                        child: Text(
                      "1",
                    )),
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/cart.png",
                    width: twidth * 0.08,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: internet_status?Column(
          children: [
            Container(
              height: theight * 0.30,
              margin: EdgeInsets.all(theight * 0.01),
              padding: EdgeInsets.all(theight * 0.01),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  // border: Border.all(width: 1,color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("PREMIUM PLAN ",
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      Text("of wash & Iron",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          )),
                      Spacer(),
                      Icon(Icons.star_rate_outlined,color: Colors.red,)
                    ],
                  ),
                  Divider(thickness: 1, color: Colors.grey),
                  Row(
                    children: [
                      Image.asset(
                        "images/rupee.png",color: Colors.black45,
                        height: theight * 0.03,
                      ),
                      Text(" ₹ 99",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("/Month",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "images/clock.png",color: Colors.black45,
                        height: 22,
                      ),
                      Text(" -1092 Days(s) Left",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("  Cloth Used ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("4",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text("Cloth Remaining ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("116  ",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("  Start Date ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("24 Apr 2019",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text("End Date ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("23 Jul 2019  ",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: theight * 0.30,
              margin: EdgeInsets.all(theight * 0.01),
              padding: EdgeInsets.all(theight * 0.01),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  // border: Border.all(width: 1,color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("BUDGET PLAN ",
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      Text("of wash & Iron",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          )),

                    ],
                  ),
                  Divider(thickness: 1, color: Colors.grey),
                  Row(
                    children: [
                      Image.asset(
                        "images/rupee.png",color: Colors.black45,
                        height: theight * 0.03,
                      ),
                      Text(" ₹ 79",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("/Month",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "images/clock.png",color: Colors.black45,
                        height: 22,
                      ),
                      Text(" -1092 Days(s) Left",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("  Cloth Used ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("12",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text("Cloth Remaining ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("168  ",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("  Start Date ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("24 Apr 2019",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text("End Date ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text("23 Jul 2019  ",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),


          ],
        ):NoInternetOrDataScreen(isNoInternet: true));
  }

  Future<void> setConnectionCheck(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        internet_status=true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internet_status=true;
      });
    }else{
      setState(() {
        internet_status=false;
      });
    }
  }

}
