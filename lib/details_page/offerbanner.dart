import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';

class offer extends StatefulWidget {
  List<String> offerbanner;
  int index;

  offer(this.offerbanner, this.index);

  @override
  State<offer> createState() => _offerState();
}

class _offerState extends State<offer> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Offer",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: theight * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/membership1.jpg"),
                        fit: BoxFit.fitWidth)),
              ),
              Container(alignment: Alignment.center,
                height: theight * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Text("",
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
                              Text("Flat 15% off",
                                  style: GoogleFonts.montserrat(
                                      fontSize: theight*0.03, fontWeight: FontWeight.w800)),
                            ],
                          ),
                          Divider(thickness: 1, color: Colors.grey),
                          Text("Wash & Fold Service",
                              style: GoogleFonts.montserrat(
                                fontSize: theight*0.03,
                              color: Colors.black)),
                          SizedBox(height: theight*0.01,),
                          Text("Get upto 40% off on cleaning, salon, and massage services.",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                          Text("Applicable only if the order contains at least one pair of Cloths.",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                          Divider(),
                          Text("Offer Valid only 30-07-2022",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Spacer(),
                   

                   
                  ],
                ),
              ),
            ],)



        ],
      ),
    );
  }
}
