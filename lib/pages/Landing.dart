import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:yi/main.dart';
import 'package:yi/pages/Home.dart';
// import 'package:yi/pages/homePageListViewSearch.dart';
// import 'package:yi/pages/storeDetails.dart';
// import 'package:yi/pages/customerDetailsFutureBuilder.dart';
// import 'package:theminisupermarket/pages/ShowOrders.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:async';
// import 'package:theminisupermarket/model/message.dart';
// import 'package:theminisupermarket/local_notications_helper.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';
import 'package:carousel_pro/carousel_pro.dart';


const PLAY_STORE_URL =
    'https://play.google.com/store/apps/details?id=com.theminisupermarket.theminisupermarket';

double currentVersion = 0.0;
double newVersion = 0.0;

double currentBuildNumber = 0.0;
double newBuildNumber = 0.0;

versionCheck(context) async {
  //Get Current installed version of app
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  currentBuildNumber = double.parse(packageInfo.buildNumber.toString());

  print('App Name:' + appName);
  print('Package Name:' + packageName);
  print('Version:' + version);
  print('Build Number:' + currentBuildNumber.toString());

  currentVersion = double.parse(packageInfo.version.trim().replaceAll(".", ""));
  print('Version(as a number for comparing with remote config):' +
      currentVersion.toString());

  //Get Latest version info from firebase config
  final RemoteConfig remoteConfig = await RemoteConfig.instance;

  try {
    // Using default duration to force fetching from remote server.
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
    remoteConfig.getString('force_update_current_version');
    print(remoteConfig.toString());
    newVersion = double.parse(remoteConfig
        .getString('force_update_current_version')
        .trim()
        .replaceAll(".", ""));
    print('Version (on Firebase Remote Config)' + newVersion.toString());
    newBuildNumber = double.parse(
        remoteConfig.getString('build_number').trim().replaceAll(".", ""));
    print(
        'Build Number (on Firebase Remote Config)' + newBuildNumber.toString());
    if (newVersion > currentVersion) {
      showVersionDialog(context);
    } else if (newVersion == currentVersion) {
      if (newBuildNumber > currentBuildNumber) {
        showVersionDialog(context);
      }
    }
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

showVersionDialog(context) async {
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String title =
          "Update Available for Version:" + currentVersion.toString();
      String message = "There is a newer version(" +
          newVersion.toString() +
          '.' +
          newBuildNumber.toString() +
          ") available. Update now?.";
      String btnLabel = "Update Now";
      String btnLabelCancel = "Later";
      // return Platform.isIOS
      //     ? new CupertinoAlertDialog(
      //         title: Text(title),
      //         content: Text(message),
      //         actions: <Widget>[
      //           FlatButton(
      //             child: Text(btnLabel),
      //             onPressed: () => _launchURL(APP_STORE_URL),
      //           ),
      //           FlatButton(
      //             child: Text(btnLabelCancel),
      //             onPressed: () => Navigator.pop(context),
      //           ),
      //         ],
      //       )
      //     :
      return new AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text(btnLabel),
            onPressed: () => launchURL(PLAY_STORE_URL),
          ),
          FlatButton(
            child: Text(btnLabelCancel),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    ));

class LandingPage extends StatelessWidget {
  LandingPage();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    print("Product Count : " + allProducts.length.toString());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'GROCERY CART',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          'GROCERY CART',
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[       
          Divider(),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             ShowCustomerDetailsFutureBuilder()));
            },
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person, color: Colors.green),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => new ShowOrders()));
            },
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket, color: Colors.green),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => StoreDetails()));
            },
            child: ListTile(
              title: Text('Store Details'),
              leading: Icon(Icons.help, color: Colors.green),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
            },
            child: ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.help, color: Colors.green),
            ),
          )
        ]),
      ),
      body: new Column(
          children: <Widget>[
              Expanded(
                flex:4,
                child:      
        Container(
           decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery
                      .of(context)
                      .size
                      .width,
          child: Carousel(
            boxFit: BoxFit.contain,
            images: [
              AssetImage('images/banners/water-cans.png'),
              AssetImage('images/banners/fruits.jpg'),
              AssetImage('images/banners/vegetables.jpg'),
              AssetImage('images/banners/pulses-cereals.jpg'),
              AssetImage('images/banners/beverages.jpg'),
              AssetImage('images/banners/dairy-products.jpg'),
              AssetImage('images/banners/dry-fruits-nuts.jpg'),
              AssetImage('images/banners/personal-care.jpg'),
              AssetImage('images/banners/home-care.jpg'),
              AssetImage('images/banners/edible-oils-ghee.png'),
              AssetImage('images/banners/spice-mixes.png'),                    
              AssetImage('images/categories/electrical-accessories.jpg'),                    

            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.black,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.white.withOpacity(0.5),
            borderRadius: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
          )
        ),
            ),          
            
      Expanded(
      flex:1,
      child: GestureDetector(
              onTap:(){
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
              },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
              'FREE HOME DELIVERY',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )),
      ),
            ),
            Expanded(
      flex: 1,
      child: GestureDetector(
              onTap:(){
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
              },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
              '7AM - 11PM',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )),
      ),
            ),
            Expanded(
      flex: 1,
      child: GestureDetector(
              onTap:(){
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
              },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
              'DELIVERY IN 90-120MINS',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )),
      ),
            ),
    Expanded(
      flex: 1,
      child: GestureDetector(
        onTap:(){
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
        },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
              'FLAT 8% OFF (MIN Rs.1000/-)',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )),
      ),
        ),
        Expanded(
      flex: 1,
      child: GestureDetector(
        onTap:(){
          // Navigator.push(context,
          //   MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
        },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
              '20L KINLEY & BISLERI AVAILABLE',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            )),
      ),
        ),
        Expanded(
      flex: 1,
      child: GestureDetector(
        onTap:(){
          // Navigator.push(context,
          //   MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
        },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
                          'SERVICE AVAILABLE IN KONDAPUR, MASJID BANDA, HAFEEZPET & GACHIBOWLI ONLY',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
              textAlign: TextAlign.center,
            )),
      ),
        ),
        Expanded(
      flex: 1,
      child: GestureDetector(
        onTap:(){
          // Navigator.push(context,
          //   MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
        },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
                          'FRESH MEAT / CHICKEN/ FISH' + '\n' + '(NEXT-DAY DELIVERY)',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0),
              textAlign: TextAlign.center,
            )),
      ),
        ),
        Expanded(
      flex: 1,
      child: GestureDetector(
        onTap:(){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePageListViewSearch()));
        },
              child: Container(
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue,
                      border: Border.all(color: Colors.grey),
                      ),
          width:MediaQuery.of(context).size.width,
          height:50.0,
            alignment: Alignment.center,
            child: new Text(
                          'START SHOPPING',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Montserrat",
                  fontSize: 20.0),
            )),
      ),
        ),
      ],
        ),        
    ),
    );
  }
}
