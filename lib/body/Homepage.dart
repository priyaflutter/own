import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/body/account.dart';
import 'package:skedulrs/body/cliningpage.dart';
import 'package:skedulrs/body/mypack.dart';
import 'package:skedulrs/body/order.dart';
import 'package:skedulrs/body/packages.dart';
import 'package:skedulrs/details_page/checkout.dart';
import 'package:skedulrs/details_page/notification_page.dart';
import 'package:skedulrs/details_page/offerbanner.dart';
import 'package:skedulrs/details_page/support_details.dart';
import 'package:skedulrs/model/catogary.dart';
import 'package:skedulrs/model/home_Screen_frame.dart';
import 'package:skedulrs/provider/internet_connection.dart';
import 'package:skedulrs/provider/service_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/nav_home_gray.png",
                width: twidth * 0.07,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Image.asset("images/nav_pack_gray.png",
                    width: twidth * 0.07),
                label: "Packages"),
            BottomNavigationBarItem(
                icon: Image.asset("images/nav_my_pack_gray.png",
                    width: twidth * 0.07),
                label: "My Pack"),
            BottomNavigationBarItem(
                icon: Image.asset("images/nav_order_gray.png",
                    width: twidth * 0.07),
                label: "Order"),
            BottomNavigationBarItem(
                icon: Image.asset("images/nav_account_gray.png",
                    width: twidth * 0.07),
                label: "Account"),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.wallet_giftcard,
            //       size: twidth * 0.07,
            //       color: Colors.green.shade500,
            //     ),
            //     label: "Wallet"),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.black,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }

  int selectedPage = 0;

  final List<Widget> pageOptions = [
    home1(),
    package(),
    mypack(),
    orders(),
    account(),
    // walletpoint(),
  ];
}

//TODO Expansation panel

class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  TextEditingController search = TextEditingController();
  bool internet_status = true;
  int cnt = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Service_pro>(context, listen: false).getproduct(context);
    Provider.of<Service_pro>(context, listen: false).Homescreenframe(context);

    setConnectionCheck(context);
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "sKedulars",
              // style: TextStyle(fontSize: theight * 0.03),
            ),
            Row(
              children: [
                Text(
                  "390019- Waghodiya Road ",
                  style: TextStyle(fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(theight * 0.02),
                            topRight: Radius.circular(theight * 0.02)),
                      ),
                      context: context,
                      builder: (context) {
                        return Container(
                            height: theight * 0.42,
                            width: twidth,
                            padding: EdgeInsets.all(theight * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: theight * 0.15,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Image.asset(
                                              "images/location_img.png",
                                              height: theight * 0.08,
                                              alignment: Alignment.center),
                                        ),
                                      ),
                                      Container(
                                        width: twidth * 0.70,
                                        padding: EdgeInsets.only(
                                            top: theight * 0.03,
                                            left: theight * 0.03),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("Hello, Nice to meet you !",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: theight * 0.02,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              height: theight * 0.01,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "Set your location to start find service around your. !",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: theight * 0.02,
                                                      color: Colors.grey)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: theight * 0.07,
                                  width: twidth * 0.90,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(theight * 0.01))),
                                  child: Center(
                                    child: Text(
                                      "Use My Current Location",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xf504091a),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Text("or"),
                                Container(
                                  height: theight * 0.07,
                                  width: twidth * 0.90,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(theight * 0.01))),
                                  child: Center(
                                    child: Text(
                                      "Select Area",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xf504091a),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  },
                  child: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                )
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return support();
                },
              ));
            },
            child: Image.asset(
              "images/support.png",
              width: twidth * 0.08,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return notification();
                    },
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/ic_notifications.png",
                    width: twidth * 0.08,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                child: Container(
                  width: twidth * 0.05,
                  child: Center(
                      child: Text(
                    "1",
                  )),
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(twidth, theight * 0.06),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xfff6f6f6),
              ),
              child: TextField(
                controller: search,
                enabled: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                    ),
                    hintText: "Search for services and packages",
                    hintStyle: TextStyle(fontFamily: "Montserrat")),
              ),
            )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              setState(() {
                makingPhoneCall();
              });
            },
            backgroundColor: Colors.white,
            child: Container(
              height: theight * 0.20,
              width: twidth * 0.20,
              child: const Icon(Icons.phone, color: Colors.black),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xf0a7a3a3),
                    Color(0x52555353),
                    Color(0xf0a7a3a3)
                  ])),
            ),
          ),
          SizedBox(
            height: theight * 0.01,
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return checkout1();
                },));
              });
            },
            backgroundColor: Colors.white,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Positioned(
                  top: 5,
                  right: 10,
                  child: Container(
                    width: twidth * 0.05,
                    child: Center(
                        child: Text(
                      "1",
                    )),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                ),
                Container(
                  height: theight * 0.20,
                  width: twidth * 0.20,
                  child: Icon(Icons.shopping_cart, color: Colors.black),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color(0xf0a7a3a3),
                        Color(0x52555353),
                        Color(0xf0a7a3a3)
                      ])),
                ),
              ],
            ),
          ),
        ],
      ),
      body: internet_status
          ? Consumer<Service_pro>(builder: (context, service, child) {
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(theight * 0.01),
              children: [
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
                    // viewportFraction: 1,
                    // autoPlay: true,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(theight * 0.01),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(theight * 0.02)),
                          image: DecorationImage(
                              image: AssetImage(
                                  AppConstant.bannerimagelist[index]),
                              fit: BoxFit.fill)),
                    );
                  },
                  itemCount: AppConstant.bannerimagelist.length,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(AppConstant.newimagelist, (index, url) {
                    return Container(
                      width: 20.0,
                      height: 3,
                      margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10.0),
                        color: AppConstant.currentimage == index
                            ? Colors.black
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                GestureDetector(
                  onTap: () {
                    // if(Provider.of<Service_pro>(context,listen: false).cat!.getService![cnt].mainServiceId.toString()=="1")
                    //   {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return clinning();
                      },
                    ));
                    // }
                  },
                  child:Image.asset(
                    "images/frame_wash_iron1.png",
                    fit: BoxFit.fill,
                    height: theight * 0.25,
                  ),
                ),
                SizedBox(
                  height: theight * 0.01,
                ),
                // Container(
                //   child: ListView.builder(
                //     itemCount:service.imageupdate!.getMainService!.length,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.vertical,
                //     itemBuilder: (context, index){
                //       return  GestureDetector(
                //           onTap: () {
                //             Navigator.push(context, MaterialPageRoute(
                //               builder: (context) {
                //                 return clinning();
                //               },
                //             ));
                //           },
                //           child:Provider.of<Service_pro>(context).status?Image.asset(
                //             "${AppConstant.CATOGARYURL}${service.imageupdate!.getMainService![index].image}",
                //             fit: BoxFit.fill,
                //             height: theight * 0.25,
                //           ):null);
                //     },),
                // ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return clinning();
                        },
                      ));
                    },
                    child: Image.asset(
                      "images/frame_wash_iron2.png",
                      fit: BoxFit.fill,
                      height: theight * 0.25,
                    )),
                SizedBox(
                  height: theight * 0.01,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return clinning();
                        },
                      ));
                    },
                    child: Image.asset(
                      "images/frame_wash_iron3.png",
                      fit: BoxFit.fill,
                      height: theight * 0.25,
                    )),
                SizedBox(
                  height: theight * 0.01,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return clinning();
                        },
                      ));
                    },
                    child: Image.asset(
                      "images/frame_wash_iron4.png",
                      fit: BoxFit.fill,
                      height: theight * 0.25,
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return package();
                      },
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: theight * 0.15,
                    padding: EdgeInsets.symmetric(horizontal: theight * 0.03),
                    margin: EdgeInsets.only(
                        top: theight * 0.01, bottom: theight * 0.01),
                    decoration: BoxDecoration(
                        color: Color(0xfff3efef),
                        // gradient: LinearGradient(colors: [
                        //   Color(0xfccca2d5),
                        //   Color(0xfccca2d5),
                        //   Color(0xfc6f076f),
                        //   Color(0xfc43044b),]),
                        borderRadius:
                        BorderRadius.all(Radius.circular(theight * 0.01))),
                    child: Row(
                      children: [
                        Expanded( flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("MEMBERSHIP BENEFITS",
                                  style: GoogleFonts.montserrat(
                                    fontSize: theight * 0.02,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text("Up to 20% Discount",
                                  style: GoogleFonts.montserrat(
                                    fontSize: theight * 0.02,
                                    fontWeight: FontWeight.w700,
                                  )),
                              // ListTile(
                              //   leading: Image.asset(
                              //     "images/coin.png",
                              //     height: theight * 0.06,
                              //   ),
                              //   trailing: Icon(Icons.arrow_forward_ios_outlined),
                              //   title: Text("MEMBERSHIP BENEFITS",
                              //       style: GoogleFonts.montserrat(
                              //         fontSize: theight * 0.02,
                              //         fontWeight: FontWeight.w700,
                              //       )),
                              // ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return package();
                                    },
                                  ));
                                },
                                child: Text("Manage"),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            side: BorderSide(
                                                color: Colors.black))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff01010e)),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 17))),
                              )
                            ],
                          ),
                        ),
                        Container( height: theight*0.15,
                          width: twidth*0.20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/super_saver.png"),fit: BoxFit.fill)),
                        )

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      SizedBox(
                        height: theight * 0.02,
                      ),
                      Text("Happy Bachat Club Member",
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
                          autoPlayAnimationDuration:
                          Duration(milliseconds: 800),
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          autoPlay: true,
                          height: theight * 0.25,
                          // enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Card(
                            shadowColor: Colors.black45,
                            child: Container(
                              height: theight * 0.20,
                              width: double.infinity,
                              decoration:
                              BoxDecoration(shape: BoxShape.rectangle),
                              margin: EdgeInsets.all(theight * 0.03),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/usericon.png",
                                    width: twidth * 0.15,
                                  ),
                                  Text(
                                    "Skedulars",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: theight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text("${AppConstant.bachat[index]}.",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87)),
                                  ),
                                  Text("${AppConstant.bachatquote[index]}",
                                      textAlign: TextAlign.center,
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
                            margin: const EdgeInsets.symmetric(
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
                Container(
                  // height: theight * 0.34,
                  decoration: BoxDecoration(
                      color: Color(0xee1d1c1d),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            AppConstant.currentimage1 = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlay: true,
                        height: theight * 0.47),
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return offer(AppConstant.offerbanner, index);
                            },
                          ));
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(theight * 0.01),
                          margin: EdgeInsets.symmetric(
                              vertical: theight * 0.04,
                              horizontal: theight * 0.01),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      AppConstant.offerbanner[index]),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(theight * 0.02))),
                        ),
                      );
                    },
                    itemCount: AppConstant.offerbanner.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map1<Widget>(AppConstant.offerbanner, (index, url) {
                    return Container(
                      width: 8.0,
                      height: theight * 0.01,
                      margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppConstant.currentimage1 == index
                            ? Colors.black
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("FAQs",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    print("onclickkkkk");
                    setState(() {
                      AppConstant.faqshome[index].isExpanded = !isExpanded;
                    });
                  },
                  children: AppConstant.faqshome.map((faqss) {
                    return ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          enabled: true,
                          title: Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: theight * 0.02),
                            child: Text(faqss.name,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: theight * 0.02)),
                          ),
                        );
                      },
                      body: ListTile(
                        title: Text(faqss.descripation,
                            style: GoogleFonts.montserrat(
                              wordSpacing: 1,
                            )),
                      ),
                      canTapOnHeader: true,
                      isExpanded: faqss.isExpanded,
                    );
                  }).toList(),
                  dividerColor: Colors.grey,
                ),
              ],
            );
          },)
          : NoInternetOrDataScreen(isNoInternet: true),
    );
  }

  List<T> map1<T>(List offerbanner, Function handler) {
    List<T> result1 = [];
    for (var i = 0; i < offerbanner.length; i++) {
      result1.add(handler(i, offerbanner[i]));
    }
    return result1;
  }

  List<T> map<T>(List newimagelist, Function handler) {
    List<T> result = [];
    for (var i = 0; i < newimagelist.length; i++) {
      result.add(handler(i, newimagelist[i]));
    }
    return result;
  }

  makingPhoneCall() async {
    var url = Uri.parse("tel: 9999999999");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("objectttt");
      throw 'Could not launch $url';
    }
  }

  Future<void> setConnectionCheck(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        internet_status = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internet_status = true;
      });
    } else {
      setState(() {
        internet_status = false;
      });
    }
  }
  home_screen_frame?  imageupdate;

}

class faqs {
  int id;
  String name;
  String descripation;
  bool isExpanded;

  faqs(this.id, this.name, this.descripation, this.isExpanded);
}
