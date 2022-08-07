import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/details_page/packagedetails.dart';

class package extends StatefulWidget {
  const package({Key? key}) : super(key: key);

  @override
  State<package> createState() => _packageState();
}

class _packageState extends State<package> {

  bool internet_status=true;
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

    return internet_status?Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ],
          title: Text("All Packages"),
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(
              left: theight * 0.01,
              right: theight * 0.01,
              bottom: theight * 0.01),
          children: [
            Column(
              children: [
                SizedBox(
                  height: theight * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/coin.png", width: twidth * 0.25),
                    SizedBox(
                      width: twidth * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Skedulars",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                                fontSize: theight * 0.02)),
                        SizedBox(
                          height: theight * 0.01,
                        ),
                        Text("MONEY SAVER CLUB",
                            style: GoogleFonts.montserrat(
                              fontSize: theight * 0.02,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("MEMBERSHIP",
                            style: GoogleFonts.montserrat(
                              fontSize: theight * 0.02,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    )
                  ],
                ),
                // Container(
                //     height: theight * 0.10,
                //     padding: EdgeInsets.all(theight * 0.02),
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage("images/ribbon.png"),
                //             fit: BoxFit.fill)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         Container(
                //           padding: EdgeInsets.only(top: theight * 0.02),
                //           margin: EdgeInsets.only(right: theight * 0.01),
                //           child: Image.asset(
                //             "images/flower.png",
                //             width: twidth * 0.07,
                //           ),
                //         ),
                //         Container(
                //           margin: EdgeInsets.only(top: theight * 0.01),
                //           child: Text("MEMBERSHIP BENEFITS",
                //               style: GoogleFonts.montserrat(
                //                 fontWeight: FontWeight.bold,
                //               )),
                //         ),
                //         Container(
                //           padding: EdgeInsets.only(top: theight * 0.02),
                //           margin: EdgeInsets.only(left: theight * 0.01),
                //           child: Image.asset(
                //             "images/flower.png",
                //             width: twidth * 0.07,
                //           ),
                //         ),
                //       ],
                //     )),
                Container(
                  // height: theight * 0.34,
                  margin: EdgeInsets.only(top: theight * 0.02),
                  padding: EdgeInsets.only(top: theight * 0.01),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Color(0xf03e3c3c),
                            Color(0x52555353),
                            Color(0xf03e3c3c)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Select a plan which suits yours needs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: theight * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: theight * 0.01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return packagedetails();
                                  },
                                ));
                              },
                              child: Container(
                                width: twidth * 0.46,
                                margin: EdgeInsets.only(bottom: 4),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: theight * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/banner.png"),
                                              fit: BoxFit.fill)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(theight * 0.01),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Wash & Iron",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: theight * 0.02,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red)),
                                          Row(
                                            children: [
                                              Text("120 ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: theight * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                "Clothes",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: theight * 0.02,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Rs.99/ ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: theight * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                "Month",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: theight * 0.02,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "🟢Activated",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: theight * 0.02,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "           View More...",
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: theight * 0.02,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return packagedetails();
                                  },
                                ));
                              },
                              child: Container(
                                width: twidth * 0.46,
                                margin: EdgeInsets.only(bottom: 4),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: theight * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/banner.png"),
                                              fit: BoxFit.fill)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(theight * 0.01),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Wash & Iron",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: theight * 0.02,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red)),
                                          Row(
                                            children: [
                                              Text("90 ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: theight * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                "Clothes",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: theight * 0.02,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Rs.79/ ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: theight * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                "Month",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: theight * 0.02,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: theight * 0.02,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "           View More...",
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: theight * 0.02,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return packagedetails();
                                  },
                                ));
                              },
                              child: Container(
                                width: twidth * 0.46,
                                margin: EdgeInsets.only(bottom: 4),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: theight * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/banner.png"),
                                              fit: BoxFit.fill)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(theight * 0.01),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Steam Iron",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: theight * 0.02,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red)),
                                          Row(
                                            children: [
                                              Text("120 ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: theight * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                "Clothes",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: theight * 0.02,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Rs.51/ ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: theight * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                "Month",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: theight * 0.02,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: theight * 0.02,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "           View More...",
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: theight * 0.02,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return packagedetails();
                                },
                              ));
                            },
                            child: Container(
                              width: twidth * 0.46,
                              margin: EdgeInsets.only(bottom: 4),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: theight * 0.12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("images/banner.png"),
                                            fit: BoxFit.fill)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(theight * 0.01),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Steam Iron",
                                            style: GoogleFonts.montserrat(
                                                fontSize: theight * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                        Row(
                                          children: [
                                            Text("180 ",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: theight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87)),
                                            Text(
                                              "Clothes",
                                              style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: theight * 0.02,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Rs.79/ ",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: theight * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87)),
                                            Text(
                                              "Month",
                                              style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: theight * 0.02,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "🟢Activated",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: theight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "           View More...",
                                          style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: theight * 0.02,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: theight * 0.01,
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xfff3efef)),
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: Column(
                children: [
                  SizedBox(
                    height: theight * 0.02,
                  ),
                  Text("What do our happy club member say?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: theight * 0.02,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: theight * 0.02,
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          AppConstant.currentimage = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      autoPlay: true,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Card(
                        shadowColor: Colors.black45,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(theight * 0.02))),
                          margin: EdgeInsets.all(theight * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("${AppConstant.bachat[index]}.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "images/usericon.png",
                                    width: twidth * 0.13,
                                  ),
                                  Container(
                                      child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate_outlined,
                                        color: Color(0xffda9e41),
                                      ),
                                      Icon(
                                        Icons.star_rate_outlined,
                                        color: Color(0xffda9e41),
                                      ),
                                      Icon(
                                        Icons.star_rate_outlined,
                                        color: Color(0xffda9e41),
                                      ),
                                      Icon(
                                        Icons.star_rate_outlined,
                                        color: Color(0xffda9e41),
                                      ),
                                      Icon(Icons.star_rate_outlined),
                                    ],
                                  )),
                                  Image.asset(
                                    "images/launcher_logo.png",
                                    height: theight * 0.07,
                                  ),
                                ],
                              ),
                              Text("${AppConstant.bachatquote[index]}",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10, color: Colors.black45)),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: AppConstant.newimagelist.length,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        map<Widget>(AppConstant.newimagelist, (index, url) {
                      return Container(
                        width: 8.0,
                        height: theight * 0.01,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppConstant.currentimage == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: theight * 0.03,
            ),
          ],
        )):NoInternetOrDataScreen(isNoInternet: true);
  }

  List<T> map<T>(List newimagelist, Function handler) {
    List<T> result = [];
    for (var i = 0; i < newimagelist.length; i++) {
      result.add(handler(i, newimagelist[i]));
    }
    return result;
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
