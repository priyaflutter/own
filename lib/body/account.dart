import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skedulrs/Screen/internet_connectivity.dart';
import 'package:skedulrs/Screen/splashsecond.dart';
import 'package:skedulrs/body/Homepage.dart';
import 'package:skedulrs/details_page/about_us.dart';
import 'package:skedulrs/details_page/faqs.dart';
import 'package:skedulrs/details_page/manage_address.dart';
import 'package:skedulrs/details_page/support_details.dart';
import 'package:skedulrs/details_page/terms_condition.dart';

class account extends StatefulWidget {
   account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {

                return home();
          },));
        },
            child:const Icon(Icons.arrow_back_rounded)),
        actions:  const [
           Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
        title: Text("My Account"),
      ),
      body:internet_status? Container(
        margin: EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return splash222();
                  },
                ));
              },
              child: Container(
                height: 70,
                decoration:  BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Text("  Log In or Sign Up",
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    Spacer(),
                     const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                     const SizedBox(
                      width: 17,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.black54),
            Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile( onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return manage();
                    },));
                  },
                      title: Text("Manage Address",
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      leading: const Icon(Icons.home),
                      trailing:const  Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return about();
                        },));
                      },
                      title: Text("Abous Us",
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      leading:  Icon(Icons.error),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return contectus();
                      },));
                    },
                      title: Text("Contact Us",
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      leading:const  Icon(Icons.contact_page_outlined),
                      trailing:const  Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  ListTile( onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return feedback();
                    },));
                  },
                      title: Text("Feedback",
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      leading:const  Icon(Icons.feedback),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  ListTile(
                      title: Text("Rate US",
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      leading: const Icon(Icons.star_rate_outlined),
                      trailing:const  Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  ListTile( onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {

                      return terms();
                    },));

                  },
                      title: Text("Terms & Condition",
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      leading:const  Icon(Icons.event_note_outlined),
                      trailing:const  Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  ListTile(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {

                      return faqsssss();
                    },));

                  },
                      title: Text("FAQs",
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      leading:const  Icon(Icons.event_note_outlined),
                      trailing:const  Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ],
              ),
            )
          ],
        ),
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
