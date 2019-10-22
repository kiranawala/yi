import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yi/main.dart';

import 'OrderConfirmation.dart';
import 'ShippingAddressSelection.dart';
// import 'package:yi/pages/RequestMapLocation.dart';
// import 'package:yi/mapWithMarker.dart';


bool savingAddress = false;



class RequestCustomerDetails extends StatefulWidget {
  @override
  _RequestCustomerDetailsState createState() => _RequestCustomerDetailsState();
}

class _RequestCustomerDetailsState extends State<RequestCustomerDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    customerAddresses = [];
    // firebaseId = 'eNlQS0GhS9U:APA91bHn6h7v-plYfLNrVD7NYn9WuUAdEKsAI9fig55Q2CJkydRXddl46mu52OvG6xueczzUQmO4vztSC0sQRzzbl7myfkyOiTs3RCatdP6fm3fRBs3-lbYewBllvWQ02Mi_mEn0Kctq';
    latitude = '0.0';
    longitude = '0.0';
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'DELIVERY DETAILS',
      )),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Center(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0, 0),
                        //   child: Text(mobileNumber,
                        //       style: TextStyle(
                        //           color: Colors.black, fontSize: 24.0)),
                        // ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "MOBILE NUMBER",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Mobile Number please!!';
                            }
                            setState(() {
                              customerDetails.mobileNumber = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "FIRST NAME",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'First Name please!!';
                            }
                            setState(() {
                              customerDetails.firstName = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "LAST NAME",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Last Name please!!';
                            }
                            setState(() {
                              customerDetails.lastName = value;
                            });
                          },
                        ),
                        TextFormField(
                          minLines: 2,
                          maxLines: 4,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.add_location),
                            labelText: "Full Address",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Full Address please!!';
                            }
                            setState(() {
                              addressDetails.fullAddress = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            labelText: "Locality",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Locality Name please';
                            }
                            setState(() {
                              addressDetails.locality = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.landscape),
                            labelText: "Nearest Landmark",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Nearest Landmark please';
                            }
                            setState(() {
                              addressDetails.landmark = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Material(
                                borderRadius: BorderRadius.circular(30.0),
                                //elevation: 5.0,
                                child: RaisedButton(
                                  onPressed: () {
                                    final form = _formKey.currentState;
                                    if (form.validate()) {
                                      print(customerDetails.firstName);
                                      print(customerDetails.lastName);
                                      print(mobileNumber);
                                      print(mobileNumber);
                                      form.save();
                                      if (!savingAddress) {
                                        savingAddress = true;
                                        // latitude = currentPosition.latitude.toString();
                                        // longitude = currentPosition.longitude.toString();
                                        latitude = '0.0';
                                        longitude = '0.0';
                                        print('Location latitude:' + latitude);
                                        print('Location longitude:' + longitude);
                                        print('Saving location to Customer Address');
                                        print(customerDetails.firstName);
                                        print(customerDetails.lastName);
                                        print(customerDetails.alternateMobileNumber);
                                        print(customerDetails.mobileNumber);


                                        FirebaseDatabase.instance
                                            .reference()
                                            .child('users')
                                            .child(firebaseId)
                                            .child('customerDetails')
                                            .child('personalDetails')
                                            .update({
                                          'firstName': customerDetails.firstName,
                                          'lastName': customerDetails.lastName,
                                          'alternateMobileNumber':
                                              customerDetails.alternateMobileNumber,
                                          'mobileNumber': mobileNumber,
                                        }).then((s) {
                                          var addresses = [];
                                              addresses.add({
                                                'fullAddress': addressDetails.fullAddress,
                                                'locality': addressDetails.locality,
                                                'landmark': addressDetails.landmark,
                                                'latitude': latitude,
                                                'longitude': longitude,
                                              });
                                              FirebaseDatabase.instance
                                                  .reference()
                                                  .child('users')
                                                  .child(firebaseId)
                                                  .child('customerDetails')
                                                  .child('addresses')
                                                  .set(addresses)
                                                  .then((snapshot) {
                                                customerDetailsAvailable = true;
                                                savingAddress = false;
                                                customerAddresses.add(new CustomerAddress(
                                                        addressDetails.fullAddress,
                                                        addressDetails.locality,
                                                        addressDetails.landmark
                                                        ));
                                                selectAddress(0);
                                                placeOrder();
                                                
                                                // Navigator.push(context,
                                                //     MaterialPageRoute(builder: (context) {
                                                //   return ShippingAddressSelection();
                                                // }));
                                              });
                                        });
                                      }
                                      // Navigator.push(
                                      //     context,
                                      //     (MaterialPageRoute(
                                      //         builder: (BuildContext context) {
                                      //       return MapWithMarker();
                                      //     })));
                                    }
                                  },
                                  color: Color(0xFF179CDF),
                                  child: Text(
                                    "PLACE ORDER",
                                    // "ADD LOCATION ON MAP",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
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

  void selectAddress(int i) {
  print(customerAddresses[i].fullAddress);
  print(customerAddresses[i].locality);
  print(customerAddresses[i].landmark);

  shippingAddress = new CustomerAddress(customerAddresses[i].fullAddress,
      customerAddresses[i].locality, customerAddresses[i].landmark);
}
}
