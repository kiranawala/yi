import 'package:flutter/material.dart';
// import 'package:yi/pages/RequestMapLocation.dart';
// import 'package:yi/pages/ShowOrders.dart';
// import 'package:yi/pages/addressLocator.dart';
// import 'package:yi/pages/customerDetailsFutureBuilder.dart';
// import 'package:yi/pages/inventory-dashboard.dart';
// import 'package:yi/pages/storeDetails.dart';

Widget appDrawerForAdmin(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: Image.asset("images/kiranawala.jpg"),
          accountName: Text(
            "KIRANAWALA STORE1",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
          accountEmail: Text(
            "kiranawala.store1@gmail.com",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return InventoryDashboard();
            // }));
          },
          title: Text(
            "INVENTORY",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            "DAILY SALES ANALYSIS",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            "TODAYS BILLS",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget appDrawerForCustomer(BuildContext context) {
  return new Drawer(
    child: new ListView(children: <Widget>[
      Divider(),
      InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ShowCustomerDetailsFutureBuilder()));
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
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => StoreDetails()));
        },
        child: ListTile(
          title: Text('Store Details'),
          leading: Icon(Icons.help, color: Colors.green),
        ),
      ),
      Divider(),
      // InkWell(
      //   onTap: () {
      //     Navigator.of(context).pop();
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => MapWithMarker()));
      //   },
      //   child: ListTile(
      //     title: Text('Address Locator'),
      //     leading: Icon(Icons.location_searching, color: Colors.green),
      //   ),
      // )
    ]),
  );
}

Widget buildTab(
    BuildContext context, String title, double width, String imagePath) {
  return Container(
    width: width,
    child: Column(
      children: <Widget>[
        Text(title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            )),
        Expanded(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}
