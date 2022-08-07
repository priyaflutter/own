import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/details_page/complete_details.dart';

class complete extends StatefulWidget {
  const complete({Key? key}) : super(key: key);

  @override
  State<complete> createState() => _completeState();
}

class _completeState extends State<complete> {

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
      itemCount: 4,
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
                    Text("${comorderid[index]} ",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                    Text("${comorderidd[index]}",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.grey.shade600,),
                    Expanded(
                      child: Text("${comAddress[index]}",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(letterSpacing: 1,
                            fontSize: 13,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.shopping_cart,color: Colors.grey.shade600,),
                    Text(" ${comgarment[index]} Garments",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.delivery_dining_sharp,color: Colors.grey.shade600,),
                    Text(" ${comdelivery[index]} Delivery",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined,color: Colors.grey.shade600,),
                    Text(" ${comtime[index]}",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                        )),
                  ],
                ),
                Divider(thickness: 2,endIndent: 2,indent: 2),
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
                          Text("₹ ${comrs[index]}",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      Spacer(),
                      GestureDetector( onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          
                                return completedetail(index,comAddress,comdelivery,comgarment,comorderidd,comrs,comtime,time2);
                              
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

  
  List<int> comgarment = [2, 6, 5, 3, 3];
   List<double> comrs = [80.00, 74.34, 61.95, 67.50, 45.00];
   List<String> comorderid = List.filled(5, "Order Id");
   List<int> comorderidd = [
    28969194,
    86194770,
    11598684,
    50298041,
    27588151
  ];
   List<String> comdelivery = [
    "Express",
    "Plus",
    "Plus",
    "Plus",
    "Plus",
  ];
   List<String> comAddress = List.filled(5,
      "Home | c-9 Maruti complex, opp, kiran export,Varachha road,Umiyadham Road,Surat,Gujarat-395006,India");

   List<String> comtime = [
    "Friday, 08 Nov 2019|08:00 AM - 10:00 AM",
    "Sunday, 21 Apr 2019|01:00 PM - 03:00 PM",
    "Sunday, 21 Apr 2019|01:00 PM - 03:00 PM",
    "Wednesday, 13 Mar 2019|01:00 PM - 03:00 PM",
    "Tuesday, 23 Apr 2019|01:00 PM - 03:00 PM",
  ];

  List<String> time2= [
    "Saturday, 09 Nov 2019|08:00 AM - 10:00 AM",
    "Monday, 22 Apr 2019|01:00 PM - 03:00 PM",
    "Monday, 22 Apr 2019|01:00 PM - 03:00 PM",
    "Thursday, 14 Nov 2019|01:00 PM - 03:00 PM",
    "Wednesday, 09 Nov 2019|08:00 AM - 10:00 AM",
  ];

}
