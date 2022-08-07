import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Notifications"),
      ),
     body: Column(children: [
       Card(
         child: Container(
           alignment: Alignment.center,
           height: theight * 0.10,
           margin: EdgeInsets.symmetric(vertical: theight*0.01),
           decoration: BoxDecoration(
               color: Colors.white,
               borderRadius:
               BorderRadius.all(Radius.circular(theight * 0.01))),
           child: ListTile(
             trailing: Text("Clear",
                 style: GoogleFonts.montserrat(
                   fontSize: theight * 0.02,
                  color: Colors.green
                 )),
             title: Text("1 Notification(s)",
                 style: GoogleFonts.montserrat(
                   fontSize: theight * 0.02,
                   fontWeight: FontWeight.w700,
                 )),
           ),
         ),
       ),
       Card(
         child: Container(
           alignment: Alignment.center,
             margin: EdgeInsets.symmetric(vertical: theight*0.01),
             padding: EdgeInsets.symmetric(horizontal: theight*0.01),
           height: theight * 0.15,
           decoration: BoxDecoration(
               color: Colors.white,
               borderRadius:
               BorderRadius.all(Radius.circular(theight * 0.01))),
           child:Column(crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,

             children: [
             Text("Order Assigned",
                 style: GoogleFonts.montserrat(
                   fontSize: theight * 0.02,
                   fontWeight: FontWeight.w700,
                 )),
             Text("Dear Jeck test,Your order(13101084) has been assigned to pratik.",
                 style: GoogleFonts.montserrat(
                   fontSize: theight * 0.02,
                   fontWeight: FontWeight.w500,
                     color: Colors.grey
                 )),
             Text("2022-07-02  11:33:19",
                 style: GoogleFonts.montserrat(
                   fontSize: theight * 0.02,
                   fontWeight: FontWeight.w500,
                   color: Colors.grey
                 )),

           ],)
         ),
       ),
     ],),
    );
  }
}
