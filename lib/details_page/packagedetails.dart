import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';

class packagedetails extends StatefulWidget {
  const packagedetails({Key? key}) : super(key: key);

  @override
  State<packagedetails> createState() => _packagedetailsState();
}

class _packagedetailsState extends State<packagedetails> {

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Package Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: internet_status?Stack(alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: theight * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/Frame 12.png"),
                        fit: BoxFit.fitHeight)),
              ),
              Container(alignment: Alignment.center,
                height: theight * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black45),
                child: Text("PURCHASE",
                    style: GoogleFonts.montserrat(
                        fontSize: theight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ],
          ),
          Stack( alignment: Alignment.bottomCenter,
            children: [
            Container(
              height: theight*0.60,
              alignment: const Alignment(1, 1),
               margin: EdgeInsets.fromLTRB(theight*0.01, 0, theight*0.01, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(theight*0.02),
                      topRight: Radius.circular(theight*0.02))),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: theight * 0.35,
                    margin: EdgeInsets.all(theight * 0.01),
                    padding: EdgeInsets.all(theight * 0.01),
                    decoration: BoxDecoration(
                        // color: Colors.grey.shade200,
                        // border: Border.all(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("STANDARD PLAN ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 13, fontWeight: FontWeight.w800)),
                            Text("of wash & Iron",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                )),
                          ],
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "images/cloth.png",color: Colors.black45,
                                  height: theight * 0.03,
                                ),
                                Text(" 90 Clothes",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,)),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "images/rupee.png",color: Colors.black45,
                                  height: theight * 0.03,
                                ),
                                Text(" Save ₹ 90    ",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "images/clock.png",color: Colors.black45,
                                  height: 22,
                                ),
                                Text(" 90 Days",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15, fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "images/rupee.png",color: Colors.black45,
                                  height: theight * 0.03,
                                ),
                                Text(" ₹ 79",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                    )),
                                Text("/Month",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                    )),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Text("Package Description",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        Divider(),
                        Text("30 Cloths/Month",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(alignment: Alignment.center,
                    height: theight * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.black45),
                    child: Text("PURCHASE",
                        style: GoogleFonts.montserrat(
                            fontSize: theight * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],)



        ],
      ):NoInternetOrDataScreen(isNoInternet: true)
    );
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
