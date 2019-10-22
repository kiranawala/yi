import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yi/main.dart';
import 'package:yi/pages/Home.dart';
import 'package:yi/pages/ShippingAddressSelection.dart';
import 'package:yi/pages/RequestCustomerDetails.dart';

import 'OrderConfirmation.dart';

class ShowCartProducts extends StatefulWidget {
  @override
  _ShowCartProductsState createState() => _ShowCartProductsState();
}

class _ShowCartProductsState extends State<ShowCartProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to Store',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'YOUR BASKET',
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'home',
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return HomePageListViewSearch();
              }));
            },
          ),
        ],
      ),
      body: new
          GridView.builder(
              itemCount: cartProducts.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height),
              ),
              itemBuilder: (BuildContext context, int index) {

                int qtyInCart = cartProducts[index].qtyInCart;
                return Container(
                  child: Card(
                    child: InkWell(
                      onTap: () {},
                      child: Material(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 40,
                              child: new Text(
                                cartProducts[index].productName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              height: 20,
                              child: new Text(
                                "\u20B9" +
                                    cartProducts[index].productPrice.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            Container(
                              height: 160.0,
                              child: new Stack(
                                children: <Widget>[
                                  new Container(
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: new Color(0xFFFFFFFF),
                                      borderRadius:
                                          new BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(cartProducts[index]
                                            .productImageURL),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: 70.0,
                                    child: Center(
                                      child: new RaisedButton(
                                        child: new IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              CartProduct cartProduct =
                                                  cartProducts[index];
                                              cartProduct.qtyInCart =
                                                  cartProduct.qtyInCart - 1;
                                              itemCount = itemCount - 1;
                                              cartTotal = cartTotal -
                                                  cartProduct.productPrice;
                                              if (cartProduct.qtyInCart == 0) {
                                                productCount = productCount - 1;
                                                cartProductMap.remove(
                                                    cartProduct.productID
                                                        .toString());
                                              } else {
                                                cartProductMap[cartProduct
                                                    .productID
                                                    .toString()] = cartProduct;
                                              }
                                              setState(() {
                                                qtyInCart =
                                                    cartProduct.qtyInCart - 1;
                                              });
                                              cartProducts.clear();
                                              for (int i = 0;
                                                  i < cartProductMap.length;
                                                  i++) {
                                                cartProducts.add(cartProductMap
                                                    .values
                                                    .elementAt(i));
                                              }
                                            }),
                                        textColor: Colors.white,
                                        color: Colors.blue,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Center(
                                      child: SizedBox(
                                    height: 40.0,
                                    width: 40.0,
                                    child: Center(
                                        child: new Text(
                                      qtyInCart.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    )),
                                  )),
                                  SizedBox(
                                    width: 60,
                                    child: ButtonTheme(
                                      minWidth: 50.0,
                                      child: new RaisedButton(
                                        child: new IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              print('add button pressed!!');
                                              CartProduct cartProduct =
                                                  cartProducts[index];
                                              cartProduct.qtyInCart =
                                                  cartProduct.qtyInCart + 1;
                                              itemCount = itemCount + 1;
                                              cartTotal = cartTotal +
                                                  cartProduct.productPrice;
                                              cartProductMap[cartProducts[index]
                                                  .productID] = cartProduct;
                                              setState(() {
                                                qtyInCart =
                                                    cartProduct.qtyInCart + 1;
                                              });
                                              cartProducts.clear();
                                              for (int i = 0;
                                                  i < cartProductMap.length;
                                                  i++) {
                                                cartProducts.add(cartProductMap
                                                    .values
                                                    .elementAt(i));
                                              }
                                            }),
                                        textColor: Colors.white,
                                        color: Colors.blue,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              child: new Text(
                                "\u20B9" +
                                    (cartProducts[index].productPrice *
                                            qtyInCart)
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: Colors.white),
            title: Text(
              'Products:' +
                  productCount.toString() +
                  '\n' +
                  'Items:' +
                  itemCount.toString(),
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            title: Text(
              'Rs. ' + cartTotal.toString() + '/-' + '\n' + 'CHECKOUT',
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 1:
              if (cartTotal > 0 && !placingOrder)
              {
                  placingOrder = true;
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return ShippingAddressSelection();
                // }));
                    // firebaseId = 'eNlQS0GhS9U:APA91bHn6h7v-plYfLNrVD7NYn9WuUAdEKsAI9fig55Q2CJkydRXddl46mu52OvG6xueczzUQmO4vztSC0sQRzzbl7myfkyOiTs3RCatdP6fm3fRBs3-lbYewBllvWQ02Mi_mEn0Kctq';

                                        FirebaseDatabase.instance
                                          .reference()
                                          .child('users')
                                          .child(firebaseId)
                                          .once()
                                          .then((snapshot){
                                            if(snapshot != null && snapshot.value != null)
                                            {
                                              List<dynamic> addressesList = snapshot.value['customerDetails']['addresses'];
                                              print(addressesList);
                                              for (var i = 0; i < addressesList.length; i++) {
                                                    customerAddresses.add(new CustomerAddress(
                                                        addressesList[i]['fullAddress'],
                                                        addressesList[i]['locality'],
                                                        addressesList[i]['landmark']));
                                              }
                                              selectAddress(0);
                                              placeOrder();
                                                //  Navigator.push(context,
                                                //     MaterialPageRoute(builder: (context) {
                                                //   return ShippingAddressSelection();
                                                // }));
                                            }
                                            else
                                            {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                    return RequestCustomerDetails();
                                                  }));                                          
                                            }
                                          });
              }
                
              break;
            case 0:
              if (cartTotal > 0)
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return ShippingAddressSelection();
                // }));
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RequestCustomerDetails();
                }));
              break;
          }
        },
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

