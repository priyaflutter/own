import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/body/Homepage.dart';
import 'package:skedulrs/body/completed.dart';
import 'package:skedulrs/body/order.dart';
import 'package:skedulrs/details_page/order_details.dart';

class orders extends StatefulWidget {
  const orders({Key? key}) : super(key: key);

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Package", style: GoogleFonts.montserrat()),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return home();
                },
              ));
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
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/cart.png",
                  width: twidth * 0.07,
                ),
              ),
            ],
          ),
        ],
        // bottom: TabBar(
        //     indicator: BoxDecoration(
        //         color: Colors.grey.shade700,
        //         borderRadius: BorderRadius.all(Radius.circular(10))),
        //     tabs: <Widget>[
        //       Tab(
        //         icon: Image.asset(
        //           "images/new_img.png",
        //           width: twidth * 0.08,
        //         ),
        //         text: "NEW",
        //       ),
        //       Tab(
        //         icon: Image.asset("images/complete_img.png",
        //             width: twidth * 0.08),
        //         text: "COMPLETED",
        //       ),
        //     ]),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: theight * 0.05,
              decoration: BoxDecoration(color: Colors.grey),
              width: double.infinity,
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: theight * 0.02,
                  ),
                  indicatorColor: Colors.black,
                  tabs: <Widget>[
                    Tab(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/new_img.png",
                            width: twidth * 0.06,
                          ),
                          Text(" NEW")
                        ],
                      ),
                    ),
                    Tab(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/complete_img.png",
                              width: twidth * 0.06),
                          Text(" COMPLETED")
                        ],
                      ),
                    ),
                  ]),
            ),
            Expanded(
                flex: 2,
                child: TabBarView(children: <Widget>[newplan(), complete()]))
          ],
        ),
        // TabBarView(children: <Widget>[newplan(), complete()])
      ),
    );
  }
}

class newplan extends StatefulWidget {
  const newplan({Key? key}) : super(key: key);

  @override
  State<newplan> createState() => _newplanState();
}

class _newplanState extends State<newplan> {

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

    return internet_status?ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: theight * 0.30,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.fromLTRB(
                theight * 0.01, theight * 0.01, theight * 0.01, 0),
            // decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text("${orderid[index]} ",
                            style: GoogleFonts.montserrat(
                                fontSize: 15, fontWeight: FontWeight.w700)),
                        Text("${orderidd[index]}",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text("Status ",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("${statuss[index]}",
                            style: statuss[index] == "Assigned"
                                ? GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)
                                : statuss[index] == "Pending"
                                    ? GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold)
                                    : statuss[index] == "Picked"
                                        ? GoogleFonts.montserrat(
                                            fontSize: 13,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.bold)
                                        : statuss[index] == "Cancel"
                                            ? GoogleFonts.montserrat(
                                                fontSize: 13,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold)
                                            : null),
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey.shade600,
                    ),
                    Expanded(
                      child: Text("${Address[index]}",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            letterSpacing: 1,
                            fontSize: 13,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.grey.shade600,
                    ),
                    Text(" ${garment[index]} Garments",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining_sharp,
                      color: Colors.grey.shade600,
                    ),
                    Text(" ${delivery[index]} Delivery",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey.shade600,
                    ),
                    Text(" ${time[index]}",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                        )),
                  ],
                ),
                Divider(thickness: 2, endIndent: 2, indent: 2),
                Container(
                  height: theight * 0.05,
                  width: double.infinity,
                  padding: EdgeInsets.all(theight * 0.01),
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text("Total : ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          Text("₹ ${rs1[index]}",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {

                              return orderdetail(index,orderidd,garment,rs1,statuss,delivery,time,Address,time2);
                        },));
                      },
                        child: Text("Details",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ):NoInternetOrDataScreen(isNoInternet: true);

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


  List<int> garment = [6, 5, 3, 1, 4];
   List<double> rs1 = [111.51, 111.51, 66.15, 51, 45];
   List<String> orderid = List.filled(5, "Order Id");
   List<int> orderidd = [
    13101084,
    34567543,
    25678543,
    65453433,
    87544333
  ];
   List<String> statuss = [
    "Assigned",
    "Picked",
    "Pending",
    "Assigned",
    "Cancel",
  ];
   List<String> delivery = [
    "Plus",
    "Express",
    "Standard",
    "Standard",
    "Express",
    "Standard",
  ];
   List<String> Address = List.filled(5,
      "Home | c-9 Maruti complex, opp, kiran export,Varachha road,Umiyadham Road,Surat,Gujarat-395006,India");

   List<String> time= [
    "Tuesday, 23 Apr 2019|01:00 PM - 03:00 PM",
    "Monday, 05 May 2019|09:00 AM - 11:00 AM",
    "Saturday, 09 Nov 2019|01:00 PM - 03:00 PM",
    "Friday, 08 Nov 2019|08:00 AM - 10:00 AM",
    "Friday, 08 Nov 2019|08:00 AM - 10:00 AM",
  ];
  List<String> time2= [
    "Wednesday, 24 Apr 2019|01:00 PM - 03:00 PM",
    "Tuesday, 06 May 2019|09:00 AM - 11:00 AM",
    "Sunday, 10 Nov 2019|01:00 PM - 03:00 PM",
    "Saturday, 09 Nov 2019|08:00 AM - 10:00 AM",
    "Saturday, 09 Nov 2019|08:00 AM - 10:00 AM",
  ];


}
