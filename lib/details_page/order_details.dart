import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';

class orderdetail extends StatefulWidget {
  int index;
  List<int> orderidd;
  List<int> garment;
  List<double> rs1;
  List<String> statuss;
  List<String> delivery;
  List<String> time;
  List<String> address;
  List<String> time2;

  orderdetail(this.index, this.orderidd, this.garment, this.rs1, this.statuss,
      this.delivery, this.time, this.address, this.time2);

  @override
  State<orderdetail> createState() => _orderdetailState();
}

class _orderdetailState extends State<orderdetail> {

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
          "All Packages",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body:internet_status? ListView(
        children: [
          Card(
            child: Container(
              alignment: Alignment.centerLeft,
              height: theight * 0.07,
              padding: EdgeInsets.all(theight * 0.01),
              // decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Text("ORDER ID : ${widget.orderidd[widget.index]}",
                  style: GoogleFonts.montserrat(
                    fontSize: theight * 0.02,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: theight * 0.01),
              padding: EdgeInsets.all(theight * 0.01),
              // decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Row(
                children: [
                  Text("👍🏻  ",
                      style: GoogleFonts.montserrat(
                          fontSize: theight * 0.04, color: Colors.green)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your order has been placed successfully",
                          style: GoogleFonts.montserrat(
                              fontSize: 12, color: Colors.grey)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return trackorder();
                            },
                          ));
                        },
                        child: Text("Track Order",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Colors.red,
                                decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Expanded(flex: 8,
              child: Container(
                // height: theight * 0.35,
                padding: EdgeInsets.all(theight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text("Personal Details",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("Jack Test",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mobile",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("9999999999",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Spacer(),
                        Icon(Icons.home_outlined),
                        Text("Home",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: twidth * 0.25,
                        ),
                        Expanded(
                          child: Text("${widget.address[widget.index]}",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Landmark",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("Varachha Road",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(theight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text("Garment Details",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  SizedBox(
                    height: theight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(
                        width: twidth * 0.01,
                      ),
                      Text("Qty",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          )),
                      Text("Price",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: theight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Towel-Steam Iron",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹5 X 1",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹ 5",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tie-Wash & Iron       ",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹10 X 1",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹ 10",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("T-shirt-Wash & Iron",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹12 X 1",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹ 12",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shirt-Wash & Iron   ",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹12 X 1",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹ 12",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jeans-Wash & Iron ",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹12 X 1",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹ 12",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: theight * 0.20,
              padding: EdgeInsets.all(theight * 0.01),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pickup Date and Time",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )),
                        Text("${widget.time[widget.index]}",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pickup Date and Time",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )),
                        Text("${widget.time2[widget.index]}",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: theight * 0.25,
              padding: EdgeInsets.all(theight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text("Payment Details",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Type",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("COD",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹ 51.00",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service type(${widget.delivery[widget.index]})",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("₹ 31.55",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Grand Total",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.green)),
                      Text("₹ 82.55",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: theight * 0.25,
              padding: EdgeInsets.all(theight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text("Transman Details",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Text("Pratik",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mobile",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                      Spacer(),
                      Text("call now",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade900)),
                      Text("   9999999999",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Profile image",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "images/launcher_logo.png",
                        height: theight * 0.10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ):NoInternetOrDataScreen(isNoInternet: true),
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

class trackorder extends StatefulWidget {
  const trackorder({Key? key}) : super(key: key);

  @override
  State<trackorder> createState() => _trackorderState();
}

class _trackorderState extends State<trackorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Row(
              children: [
                Image.asset("images/green_check.png",height: 25),
              ],
            ),
            Image.asset("images/green_check.png",height: 25),
            Image.asset("images/green_check.png",height: 25),
            Image.asset("images/green_check.png",height: 25),

        ],
      ),
          )),
    );
  }


}
