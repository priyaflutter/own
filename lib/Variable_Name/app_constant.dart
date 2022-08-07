import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skedulrs/body/Homepage.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';


class AppConstant {
  //TODO Homepage

  static List<String> bachatquote = [
    "Mina Shah",
    "Raj Jariwala",
    "Pradip Dave"
  ];

  static List<String> bannerimagelist = [
    "images/banner3.jpg",
    "images/banner4.jpg",
    "images/banneriron1.jpeg",
  ];
  static List<String> title = ["T-Shirt", "Shirt", "Shorts", "Jeans"];
  static List<String> subtitle = List.filled(4, "per piece");
  static List<String> rs = ["10", "20", "15", "10"];
  static List<int> count = List.filled(4, 0);
  static List<bool> status_cart = List.filled(4, false);
  static List<String> image = [
    "images/tshirt.png",
    "images/shirt.png",
    "images/shorts.png",
    "images/jeans.png",
  ];
    static List<String> deliveryoffers = [
    "images/day1.png",
    "images/day2.png",
    "images/day3.png",
  ];


  static List<String> womentitle = ["T-Shirt", "Top", "Kurtis", "Bra"];
  static List<String> womensubtitle = List.filled(4, "per piece");
  static List<String> womenrs = ["10", "12", "20", "15"];
  static List<String> womenimage = ["👚", "👘", "👗", "👙"];

  static List<String> housetitle = [
    "Towel",
    "Small Curtain",
    "Blanket",
    "Curtain"
  ];
  static List<String> housesubtitle = List.filled(4, "per piece");
  static List<String> housers = ["15", "10", "25", "15"];

  static List<String> houseimage = [
    "images/towel.png",
    "images/small curtain.png",
    "images/blanket.png",
    "images/curtains.png",
  ];

  static bool active = false;

  //TODO HOme page
  static List newimagelist = ["", "", ""];
  static int currentimage = 0;
  static int currentimage1 = 0;
  static int selectpage = 0;
  static List<String> bachat = [
    "Good Discount through bachat club are Saving more money ion a month",
    "Bachat club is very effective. I save money for every month",
    "Most items are available at lesser prices. I save every month after renewing this wonderful membership",
  ];


  static List<faqs> faqshome1 = [
    faqs(1, "What are the benefits of happy club memebership?",
        "Happy club membership save 15% on every order. Additionally, they get acess to top-rate plus proffesional. Happy club memebrship are a curated set of proffessionals who are top-rated,specially trained,and expert in their field",
        false),
    faqs(2, "How does 100% money back gurantee work?",
        "If a subscriber saves less than the membership price at the end of the memebrship period",
        false),
    faqs(3, "Who is Happy club membership?",
        "Happy club membership are a created set of professionals who are top-rated,specialy trained",
        false),
    faqs(4, "Can I pay for membership through cash?",
        "Membership can only be bought by paying online", false),
  ];
    static List<faqs> faqshome = [
      faqs(1, "How to schedule my first pick-up?",
          "Scheduling your pick up is merely a few clicks away on our Website/App.For bookings through website, you put in your contact details with pick-up and delivery slots and pick up boy will be there in time. For bookings through app, just visit play store and search “pick my laundry” to download Android App. Click here to download it directly from Google Play. In case pick-up gets delayed due to unforeseen circumstances, our team will update you before-hand.",
          false),
      faqs(2, "How to reschedule a missed pickup/delivery?",
          "If you happen to have missed your pickup/delivery, you can simply reschedule it by calling at our call centre number and we will reschedule it.",
          false),
      faqs(3, "What’s your turnaround time?",
          "We take 48 Hours for laundry and 72 hours for dry cleaning. But in case of an emergency, we can make special arrangements.",
          false),
      faqs(4, "How do you accept payment?",
          "We accept cash from our customers to be given to our delivery boy once you have received your clothes. We provide our riders with sufficient amount of change so you need to worry about ‘khulle paise’. Also, you can pay online by clicking the link in the SMS sent to you when the rider is out for delivery. With the release of PML app now, we plan to create a wallet system for online transactions.",
          false),
      faqs(5, "What is the minimum order size?",
          "Our Minimum order value is Rs 250.", false),
      faqs(6, "Do I need to tip the delivery rider?",
          "No need to search your pockets for that extra bit, we motivate our boys with ample incentives!",
          false),
    ];

//TODO Package

  static List<String> packagebanner = List.filled(4, "Wash & Iron Starts @");
  static List packagenewimagelist = ["", "", ""];
  static int packagecurrentimage = 0;
  static List<String> packagebachat = [
    "Good Discount through bachat club are Saving more money ion a month",
    "Bachat club is very effective. I save money for every month",
    " ",
  ];
  static List<String> offerbanner = [
    "images/Layer 11.png",
    "images/Layer 3.png",
    "images/Layer 21.png",
  ];
  static List<int>Date=[30,31,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29];
  static List<String>Days=["Sat","Sun","Mon","Tue","Wen","Thu","Fri","Sat","Sun","Mon","Tue","Wen","Thu","Fri","Sat","Sun","Mon","Tue","Wen","Thu","Fri","Sat","Sun","Mon","Tue","Wen","Thu","Fri","Sat","Sun","Mon"];

//TODO Order
// static List<int> garment = [6, 5, 3, 1, 4];
// static List<double> rs1 = [111.51, 111.51, 66.15, 51, 45];
// static List<String> orderid = List.filled(5, "Order Id");
// static List<int> orderidd = [
//   13101084,
//   34567543,
//   25678543,
//   65453433,
//   87544333
// ];
// static List<String> statuss = [
//   "Assigned",
//   "Picked",
//   "Pending",
//   "Assigned",
//   "Cancel",
// ];
// static List<String> delivery = [
//   "Plus",
//   "Express",
//   "Standard",
//   "Standard",
//   "Express",
//   "Standard",
// ];
// static List<String> Address = List.filled(5,
//     "Home | c-9 maruti complex, opp, kiran export,Varachha road,Umiyadham Road,Surat,Gujarat-395006,India");
//
// static List<String> time= [
//   "Tuesday, 23 Apr 2019|01:00 PM - 03:00 PM",
//   "Monday, 05 May 2019|09:00 AM - 11:00 AM",
//   "Saturday, 09 Nov 2019|01:00 PM - 03:00 PM",
//   "Friday, 08 Nov 2019|08:00 AM - 10:00 AM",
//   "Friday, 08 Nov 2019|08:00 AM - 10:00 AM",
// ];

//TODO Completed

// static List<int> comgarment = [2, 6, 5, 3, 3];
// static List<double> comrs = [80.00, 74.34, 61.95, 67.50, 45.00];
// static List<String> comorderid = List.filled(5, "Order Id");
// static List<int> comorderidd = [
//   28969194,
//   86194770,
//   11598684,
//   50298041,
//   27588151
// ];
// static List<String> comdelivery = [
//   "Express",
//   "Plus",
//   "Plus",
//   "Plus",
//   "Plus",
// ];
// static List<String> comAddress = List.filled(5,
//     "Home | c-9 maruti complex, opp, kiran export,Varachha road,Umiyadham Road,Surat,Gujarat-395006,India");
//
// static List<String> comtime = [
//   "Friday, 08 Nov 2019|08:00 AM - 10:00 AM",
//   "Sunday, 21 Apr 2019|01:00 PM - 03:00 PM",
//   "Sunday, 21 Apr 2019|01:00 PM - 03:00 PM",
//   "Wednesday, 13 Mar 2019|01:00 PM - 03:00 PM",
//   "Tuesday, 23 Apr 2019|01:00 PM - 03:00 PM",
// ];


//TODO Clinning page
  static bool issearch = false;

  static showsnackbar(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 5),
      content: Text(msg),
      backgroundColor: Colors.black,
    ));
  }

  static gettost(String msg){
    Toast.show(msg,
        duration: Toast.lengthShort,
        gravity: Toast.center);
  }

  static String BASEURL="http://skedulars.workfordemo.in/AndroidClass/";
  static String SERVICEIMAGEURL="http://skedulars.workfordemo.in/AndroidClass/service_img/";
  static String CATOGARYURL="http://skedulars.workfordemo.in/admin/assets/images/category/";
  static String HOMESCREENFRAME="api_mrbubble.php?request_for=update_service_img&id=1&image=c5d1f963cf2df0540f83113b5c0188e.png";
}







