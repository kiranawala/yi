import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yi/main.dart';
import 'package:yi/pages/shippingAddressSelection.dart';
import 'package:yi/shared/widgets.dart';

class MapLocationConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:Text(
          'Location Confirmation',
            style:TextStyle(
             color:Colors.blue,
             fontFamily: 'Montserrat',
             fontSize: 14.0,
             fontWeight: FontWeight.bold
            ),
        )
      ),
      drawer: appDrawerForCustomer(context),
      body:
      new Container(
        child:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'LATITUDE:',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      latitude,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
             Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'LONGITUDE:',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      longitude,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
                Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'ADDRESS:',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      addressFromGoogle,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
              //                 Row(
              //   children: <Widget>[
              //     Expanded(
              //       flex: 4,
              //         child:Text(
              //         'FIREBASE ID:',
              //           style:TextStyle(                          
              //             color:Colors.blue,
              //             fontFamily: 'Montserrat',
              //             fontSize: 12.0,
              //             fontWeight: FontWeight.bold
              //           ),
              //           textAlign: TextAlign.right
              //         ),
              //     ),
              //     Expanded(
              //       flex:8,
              //       child:Text(
              //         firebaseId,
              //           style:TextStyle(                          
              //             color:Colors.black,
              //             fontFamily: 'Montserrat',
              //             fontSize: 12.0,
              //             fontWeight: FontWeight.bold
              //           ),
              //           textAlign: TextAlign.left,
              //         ),
              //     ),                  
              //   ],
              // ),
               Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'FIRST NAME:',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      customerDetails.firstName,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
                             Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'LAST NAME:',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      customerDetails.firstName,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'Mobile Number:',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      mobileNumber,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
              //                Row(
              //   children: <Widget>[
              //     Expanded(
              //       flex: 4,
              //         child:Text(
              //         'Alternate Mobile Number:',
              //           style:TextStyle(                          
              //             color:Colors.blue,
              //             fontFamily: 'Montserrat',
              //             fontSize: 12.0,
              //             fontWeight: FontWeight.bold
              //           ),
              //           textAlign: TextAlign.right
              //         ),
              //     ),
              //     Expanded(
              //       flex:8,
              //       child:Text(
              //         mobileNumber,
              //           style:TextStyle(                          
              //             color:Colors.black,
              //             fontFamily: 'Montserrat',
              //             fontSize: 12.0,
              //             fontWeight: FontWeight.bold
              //           ),
              //           textAlign: TextAlign.left,
              //         ),
              //     ),                  
              //   ],
              // ),
                             Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'fullAddress',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      addressDetails.fullAddress,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
                             Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'locality',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      addressDetails.locality,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),
                             Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                      child:Text(
                      'landmark',
                        style:TextStyle(                          
                          color:Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                  ),
                  Expanded(
                    flex:8,
                    child:Text(
                      addressDetails.landmark,
                        style:TextStyle(                          
                          color:Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),                  
                ],
              ),      
              Row(
                          children: <Widget>[
                            Expanded(
                              child: Material(
                                borderRadius: BorderRadius.circular(30.0),
                                //elevation: 5.0,
                                child: RaisedButton(
                                  onPressed: () {
                                      print(customerDetails.firstName);
                                      print(customerDetails.lastName);
                                      print(customerDetails
                                          .alternateMobileNumber);
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
                                            customerDetails
                                                .alternateMobileNumber,
                                        'mobileNumber': mobileNumber,
//                                  'fullAddress':_addressDetails.fullAddress,
//                                 'locality': _addressDetails.locality,
//                                  'landmark':_addressDetails.landmark
                                      }).then((s) {
                                        var addresses = [];
                                        FirebaseDatabase.instance
                                            .reference()
                                            .child('users')
                                            .child(firebaseId)
                                            .child('customerDetails')
                                            .child('addresses')
                                            .once()
                                            .then((snapshot) {
                                          if (snapshot.value != null) {
                                            //print(snapshot.value);
                                            addresses.add(snapshot.value);
                                            addresses.add({
                                              'fullAddress':
                                                  addressDetails.fullAddress,
                                              'locality':
                                                  addressDetails.locality,
                                              'landmark':
                                                  addressDetails.landmark
                                            });
                                            //print(addresses);
                                            //addresses = snapshot.value.toList();
                                            //addresses.add(_addressDetails);
                                            FirebaseDatabase.instance
                                                .reference()
                                                .child('users')
                                                .child(firebaseId)
                                                .child('customerDetails')
                                                .child('addresses')
                                                .set(addresses)
                                                .then((snapshot) {
                                              customerDetailsAvailable = true;
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ShippingAddressSelection();
                                              }));
                                            });
                                          } else {
                                            //print('No Previous orders present');
                                            addresses.add({
                                              'fullAddress':
                                                  addressDetails.fullAddress,
                                              'locality':
                                                  addressDetails.locality,
                                              'landmark':
                                                  addressDetails.landmark
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
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ShippingAddressSelection();
                                              }));
                                            });
                                          }
                                        }).catchError( (error) =>
                                                {print(error.toString())});
                                      });
                                  },
                                  color: Color(0xFF179CDF),
                                  child: Text(
                                    "SAVE ADDRESS",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),        
            ]            
          ),
        ),
      ),
    );
  }
}
