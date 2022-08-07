import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Variable_Name/app_constant.dart';
import 'package:skedulrs/details_page/order_summery.dart';

class booking extends StatefulWidget {
  const booking({Key? key}) : super(key: key);

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {

  int tapcolor=0;
  int tapcolor1=0;
  int offercolor=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      tapcolor=list.length;
      tapcolor1=time.length;
      offercolor=AppConstant.deliveryoffers.length;
  }
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Schedule Booking", style: GoogleFonts.montserrat()),
        centerTitle: true,
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
                  width: twidth * 0.08,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pickup Date & Time",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                            color: Color(0xf8010a1c),
                            fontWeight: FontWeight.w500
                        )),
                    Text("July 2022",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: theight * 0.08,
                child: ListView.builder(
                  itemCount:list.length,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: () {
                          setState(() {
                            tapcolor=index;
                          });
                    },
                      child: Container(
                        width: twidth * 0.20,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color:tapcolor==index?Color(0xf8010a1c):Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          children: [
                            Text("${AppConstant.Date[index]}",
                                style: GoogleFonts.montserrat(
                                  fontSize: theight * 0.02,
                                  color:tapcolor==index?Colors.white:Colors.black,
                                )),
                            Text("${AppConstant.Days[index]}",
                                style: GoogleFonts.montserrat(
                                  fontSize: theight * 0.02,
                                  color:tapcolor==index?Colors.white:Colors.black,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: theight*0.01,),
              Container(
                height: theight * 0.05,
                margin: EdgeInsets.all(theight * 0.01),
                child: ListView.builder(
                  itemCount: 3,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder:(context, index) {
                  return  GestureDetector(onTap: () {
                    setState(() {
                      tapcolor1=index;
                    });
                  },
                    child: Container(
                      alignment: Alignment.center,
                      height: theight * 0.02,
                      margin:
                      EdgeInsets.symmetric(horizontal: theight * 0.01),
                      padding:
                      EdgeInsets.symmetric(horizontal: theight * 0.01),
                      decoration: BoxDecoration(
                          color:tapcolor1==index?Color(0xf8010a1c):Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1,color: Color(0xf8010a1c),)),
                      child: Text(time[index],style: TextStyle( color:tapcolor1==index?Colors.white:Colors.black,
                      ),),
                    ),
                  );
                },),
              ),
              SizedBox(height: theight*0.01,),
              Padding( padding: EdgeInsets.symmetric(horizontal:  theight * 0.01),
                child: Text("Delivery Type",
                    style: GoogleFonts.montserrat(
                      fontSize: theight * 0.02,
                        color: Color(0xf8010a1c),
                        fontWeight: FontWeight.w500
                    )),
              ),
              Card(
                child: Container(
                  height: theight * 0.08,
                  margin: EdgeInsets.all( theight * 0.01),
                  child: ListView.builder(
                      itemCount: 3,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                    return  GestureDetector(onTap: () {
                      setState(() {
                        offercolor=index;
                      });
                    },
                      child: Container(
                        width: twidth*0.33,
                        decoration: BoxDecoration(color:offercolor==index?Color(0xf8010a1c):Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Image(image: AssetImage(AppConstant.deliveryoffers[index]))),
                    );
                  },
                  ),
                ),
              ),
              Padding( padding: EdgeInsets.symmetric(horizontal:  theight * 0.01),
                child: Text("Delivery Details",
                    style: GoogleFonts.montserrat(
                      fontSize: theight * 0.02,
                      color: Color(0xf8010a1c),
                      fontWeight: FontWeight.w500
                    )),
              ),
              Card(
                child: Container(
                  height: theight * 0.10,
                  width: double.infinity,
                  margin: EdgeInsets.all(theight*0.01),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Sunday, 31 July 2022",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                  )),
                              Text("beetween 08:00 AM - 10:00 AM",
                                  maxLines: 2,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Plus Delivery",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                      color: Color(0xf8010a1c),
                                      fontWeight: FontWeight.w500
                                  )),
                              Text("24 hours turnaround ₹30 min.order amount",
                                  maxLines: 3,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Service Fees",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                  )),
                              Text("1.5 X",
                                  maxLines: 2,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Colors.green
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          GestureDetector( onTap:() {
            
            Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return order_summery();
            },));
          },
            child: Container(
              alignment: Alignment.center,
              height: theight * 0.07,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff4c4a4a), Color(0xff1c1b1b)])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                      Positioned(
                        top: 1,
                        right: -1,
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
                    ],
                  ),
                  SizedBox(
                    width: twidth * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("₹ 10.00",
                          style: GoogleFonts.montserrat(color: Colors.white)),
                      Text(" 1 Garments",
                          style: GoogleFonts.montserrat(color: Colors.white)),
                    ],
                  ),
                  Spacer(),
                  Container(alignment: Alignment.center,
                    padding: EdgeInsets.all(theight*0.01),
                    height: theight * 0.05,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Text("Schedule",
                        style: GoogleFonts.montserrat(
                            fontSize: theight * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<String> list=List.filled(31,"");
  List<String> time=["08:00AM - 10:00AM","01:00PM - 03:00PM","06:00PM - 08:00PM"];
}
