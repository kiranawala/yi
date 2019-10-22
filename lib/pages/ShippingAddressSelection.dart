import 'package:yi/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
//import 'package:sms/sms.dart';
import 'package:yi/pages/AuthenticateAndRetrieveCustomerDetails.dart';

import 'OrderConfirmation.dart';

Map<dynamic,dynamic> orderedProduct = <dynamic,dynamic>{};
List<dynamic> orderedProducts = <dynamic>[];
Map<dynamic,dynamic> personalDetails = <dynamic,dynamic>{};

class ShippingAddressSelection extends StatefulWidget {
  @override
  _ShippingAddressSelectionState createState() =>
      _ShippingAddressSelectionState();
}

class _ShippingAddressSelectionState extends State<ShippingAddressSelection> {
  @override
  Widget build(BuildContext context) {
    // firebaseId = 'SlCjsbj4TeRZ0KFKef2AsjFNhMW2';
    print(firebaseId);
    otpAuthenticated = true;
    customerDetailsAvailable = true;
    if (otpAuthenticated && customerDetailsAvailable) {
      print('OTPAUTHENTICATED && CUSTOMERDETAILSAVAILABLE');

      return Scaffold(
          appBar: AppBar(
            title: Text('Delivery Address',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
          ),
          body: new Container(
              width: MediaQuery.of(context).size.width,
              // alignment: Alignment.center,
              // padding: const EdgeInsets.all(16.0),
              child: new StreamBuilder(
                  stream: FirebaseDatabase.instance
                      .reference()
                      .child('users')
                      .child(firebaseId)
                      .child('customerDetails')
                      .onValue,
                  builder:
                      (BuildContext context, AsyncSnapshot<Event> snapshot) {
                    if (snapshot.hasData) {
                      print(
                          'shippingAddressSelection.dart:snapshot.hasData is true');
                      if (snapshot.data != null &&
                          snapshot.data.snapshot.value != null) {
                        print(
                            'shippingAddressSelection.dart:snapshot.data != null && snapshot.data.value != null');
                        DataSnapshot s = snapshot.data.snapshot;
                        print(s);
                        listAddresses = [];
                        for (var i = 0; i < s.value['addresses'].length; i++) {
                          customerAddresses.add(new CustomerAddress(
                              s.value['addresses'][i]['fullAddress'],
                              s.value['addresses'][i]['locality'],
                              s.value['addresses'][i]['landmark']));

                          listAddresses.add(Container(
                            margin: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                                onPressed: () {
                                  if (!placingOrder) {
                                    placingOrder = true;
                                    selectAddress(i);
                                    placeOrder();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                          s.value['addresses'][i]
                                              ['fullAddress'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.0)),
                                      Text(s.value['addresses'][i]['locality'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.0)),
                                      Text(s.value['addresses'][i]['landmark'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.0)),
                                    ],
                                  ),
                                )),
                          ));
                        }
                        return ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                  child: Text('Select Delivery Address',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0))),
                            ),
                            Divider(
                              height: 5.0,
                            ),
                            Column(
                              children: listAddresses,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        );
                      } else {
                        print('First Else condition....');
                        return AuthenticateAndRetrieve();
                      }
                    } else {
                      print('Second Else condition....');
                      return CircularProgressIndicator();
                    }
                  })));
    } else
      print('third Else condition.....');
    return AuthenticateAndRetrieve();
  }

  void placeOrder() {
    orderedProducts = [];
    cartProducts.forEach((f) {
      orderedProduct = {
        'productId': f.productID,
        'productName': f.productName,
        'productPrice': f.productPrice,
        'orderQty': f.qtyInCart,
        'productImageURL': f.productImageURL,
        'productBarCode': f.productBarCode,
      };
      orderedProducts.add(orderedProduct);
    });

    DateTime now = DateTime.now();
    String orderTime = DateFormat('kk:mm:ss').format(now);
    String orderDate = DateFormat('ddMMMyyy').format(now);

    var orderDetails = {
      'orderDate': orderDate,
      'orderTime': orderTime,
      'orderAmount': cartTotal.toString(),
      'productCount': productCount.toString(),
      'itemCount': itemCount.toString(),
      'orderedProducts': orderedProducts,
      'userID': firebaseId,
    };

    orderFirebaseId =
        FirebaseDatabase.instance.reference().child('orders').push().key;
    if (orderFirebaseId != '') {
      print('ORDER FIREBASE ID IS' + orderFirebaseId);
      var orderIds = [];
      FirebaseDatabase.instance
          .reference()
          .child('orders')
          .child(orderFirebaseId)
          .update(orderDetails)
          .then((value) {
        print('ORDER DETAILS ADDED TO FIREBASE');
        print('ORDER DETAILS SENT TO STORE CONTACT');
        print('ATTEMPTING TO UPDATE CUSTOMER DETAILS WITH ORDER DETAILS');
        FirebaseDatabase.instance
            .reference()
            .child('users')
            .child(firebaseId)
            .child('orders')
            .once()
            .then((snapshot) {
          if (snapshot.value != null) {
            print('LOOKS LIKE CUSTOMER HAS PLACED ORDERS PREVIOUSLY');
            orderIds = snapshot.value.toList();
            orderIds.add(orderFirebaseId);
            FirebaseDatabase.instance
                .reference()
                .child('users')
                .child(firebaseId)
                .child('orders')
                .set(orderIds)
                .then((snapshot) {
              print('CUSTOMER DETAILS UPDATED WITH NEW ORDER LIST');
              print('CHECKING IF PERSONAL DETAILS/ADDRESSES PRESENT');
              FirebaseDatabase.instance
                  .reference()
                  .child('users')
                  .child(firebaseId)
                  .child('customerDetails')
                  .once()
                  .then((snapshot) {
                if (snapshot.value != null) {
                  personalDetails = snapshot.value['personalDetails'];
                  print('CUSTOMER DETAILS NODE AVAILABLE');
                  print('CHECKING IF ADDRESS(S) AVAILABLE');
                  FirebaseDatabase.instance
                      .reference()
                      .child('users')
                      .child(firebaseId)
                      .child('customerDetails')
                      .child('addresses')
                      .once()
                      .then((snapshot) {
                    if (snapshot.value != null) {
                      print('CUSTOMER DETAILS/ADDRESSES NODE AVAILABLE');
                      var addresses = snapshot.value.toList();
                      FirebaseDatabase.instance
                          .reference()
                          .child('orders')
                          .child(orderFirebaseId)
                          .child('shippingAddress')
                          .update({
                        'fullAddress': shippingAddress.fullAddress,
                        'locality': shippingAddress.locality,
                        'landmark': shippingAddress.landmark
                      }).then((snapshot) {
                        print('ORDER DETAILS UPDATED WITH SHIPPING ADDRESS');
                        FirebaseDatabase.instance
                            .reference()
                            .child('orders')
                            .child(orderFirebaseId)
                            .child('personalDetails')
                            .update({
                          'firstName': personalDetails['firstName'],
                          'lastName': personalDetails['lastName'],
                          'mobileNumber': personalDetails['mobileNumber']
                        }).then((snapshot) {
                          print('ORDER DETAILS UPDATED WITH CUSTOMER DETAILS');
                          print('NAVIGATING TO ORDER CONFIRMATION PAGE');
                          //////////////// CLEAR CART DETAILS //////////////////
                          cartProducts.clear();
                          cartProductMap.clear();
                          cartTotal = 0.0;
                          productCount = 0;
                          itemCount = 0.0;
                          orderedProducts = [];
                          //////////////// CLEAR CART DETAILS ////////////////////
                          placingOrder = false;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OrderConfirmation();
                          }));
                        });
                      });
                    } else {
                      print(
                          'ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
                      print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return CustomerAddressForm();
                      // }));
                    }
                  });
                } else {
                  print(
                      'ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
                  print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return CustomerAddressForm();
                  // }));
                }
              });
            });
          } else {
            //print('No Previous orders present');
            print('NEW CUSTOMER/ORDER. ADDING ORDER TO CUSTOMER DETAILS');
            orderIds.add(orderFirebaseId);
            FirebaseDatabase.instance
                .reference()
                .child('users')
                .child(firebaseId)
                .child('orders')
                .set(orderIds)
                .then((snapshot) {
              print('CUSTOMER DETAILS UPDATED WITH NEW ORDER LIST');
              print('CHECKING IF PERSONAL DETAILS/ADDRESSES PRESENT');
              FirebaseDatabase.instance
                  .reference()
                  .child('users')
                  .child(firebaseId)
                  .child('customerDetails')
                  .once()
                  .then((snapshot) {
                if (snapshot.value != null) {
                  personalDetails = snapshot.value['personalDetails'];
                  print('CUSTOMER DETAILS NODE AVAILABLE');
                  print('CHECKING IF ADDRESS(S) AVAILABLE');
                  FirebaseDatabase.instance
                      .reference()
                      .child('users')
                      .child(firebaseId)
                      .child('customerDetails')
                      .child('addresses')
                      .once()
                      .then((snapshot) {
                    if (snapshot.value != null) {
                      print('CUSTOMER DETAILS/ADDRESSES NODE AVAILABLE');
                      var addresses = snapshot.value.toList();
                      FirebaseDatabase.instance
                          .reference()
                          .child('orders')
                          .child(orderFirebaseId)
                          .child('shippingAddress')
                          .update({
                        'fullAddress': shippingAddress.fullAddress,
                        'locality': shippingAddress.locality,
                        'landmark': shippingAddress.landmark
                      }).then((snapshot) {
                        print('ORDER DETAILS UPDATED WITH SHIPPING ADDRESS');
                        FirebaseDatabase.instance
                            .reference()
                            .child('orders')
                            .child(orderFirebaseId)
                            .child('personalDetails')
                            .update({
                          'firstName': customerDetails.firstName,
                          'lastName': customerDetails.lastName,
                          'mobileNumber': customerDetails.mobileNumber
                        }).then((snapshot) {
                          print('ORDER DETAILS UPDATED WITH CUSTOMER DETAILS');
                          print('NAVIGATING TO ORDER CONFIRMATION PAGE');
                          //////////////// CLEAR CART DETAILS //////////////////
                          cartProducts.clear();
                          cartProductMap.clear();
                          cartTotal = 0.0;
                          productCount = 0;
                          itemCount = 0.0;
                          orderedProducts = [];
                          //////////////// CLEAR CART DETAILS ////////////////////
                          placingOrder = false;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OrderConfirmation();
                          }));
                        });
                      });
                    } else {
                      print(
                          'ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
                      print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return CustomerAddressForm();
                      // }));
                    }
                  });
                } else {
                  print(
                      'ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
                  print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return CustomerAddressForm();
                  // }));
                }
              });
            });
          }
        }).catchError((error) => {print(error.toString())});
      }).catchError((error) => {print(error.toString())});
    } else {
      print('WARNING/ERROR: FIREBASE ID FOR ORDER OS EMPTY');
    }
  }
}

void selectAddress(int i) {
  print(i);
  print(customerAddresses[i].fullAddress);
  print(customerAddresses[i].locality);
  print(customerAddresses[i].landmark);

  shippingAddress = new CustomerAddress(customerAddresses[i].fullAddress,
      customerAddresses[i].locality, customerAddresses[i].landmark);
}
