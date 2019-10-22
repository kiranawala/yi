import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:yi/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:yi/pages/ShippingAddressSelection.dart';
import 'package:yi/pages/RequestCustomerDetails.dart';


class AuthenticateAndRetrieve extends StatefulWidget {
  @override
  _AuthenticateAndRetrieveState createState() => _AuthenticateAndRetrieveState();
}

class _AuthenticateAndRetrieveState extends State<AuthenticateAndRetrieve> {
  // Inside State class.
  String verificationId;
  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController smsCodeTextController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FocusNode mobileNumberFocusNode;
  FocusNode smsCodeFocusNode;
  String mobile;
  bool isLoading = false;


  /// Sign in using an sms code as input.
  void _signInWithPhoneNumber(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
    final FirebaseUser user = await FirebaseAuth.instance.signInWithCredential(credential);
    otpAuthenticated = true;
    mobileNumber = mobile;
    // firebaseId = user.uid.toString();

    FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(firebaseId)
        .child('fcmToken')
        .set({'fcmToken':firebaseId}).then((snapshot) =>{
      print('FCM Token written to user details in Firebase')
    }).catchError((error)=>{
      print('Failed to write FCM Token to user details in Firebase')
    });

    //Check and retrieve details if available    
    print('Moile number authenticated!!');
              FirebaseDatabase.instance
                  .reference()
                  .child('users')
                  .child(firebaseId)
                  .child('customerDetails')
                  .once().then((snapshot) {
                if (snapshot.value != null) {
                  print('CUSTOMER DETAILS NODE AVAILABLE');
                  print('CHECKING IF ADDRESS(S) AVAILABLE');
                  FirebaseDatabase.instance
                      .reference()
                      .child('users')
                      .child(user.uid)
                      .child('customerDetails')
                      .child('addresses')
                      .once().then((snapshot) {


                    if(snapshot.value!= null)
                    {
                      print('CUSTOMER DETAILS/ADDRESSES NODE AVAILABLE');
                      customerDetailsAvailable = true;

                      FirebaseDatabase.instance
                          .reference()
                          .child('users')
                          .child(firebaseId)
                          .child('fcmToken')
                          .set({'fcmToken':firebaseId}).then((snapshot) =>{
                            print('FCM Token written to user details in Firebase')
                      }).catchError((error)=>{
                        print('Failed to write FCM Token to user details in Firebase')
                      });
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ShippingAddressSelection();
                        }));
                    }
                    else{
                      print('ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
                      print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return RequestCustomerDetails();
                      }));
                    }
                  });
                }
                else {
                  print('ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
                  print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RequestCustomerDetails();
                  }));
                }
              });
      print('signed in with phone number successful: user -> $user');
      print('uid:' + user.uid);
      print('phoneNumber:' + user.phoneNumber);
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: new Text('SIGNED IN  - USER ID:' + user.uid,  
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontFamily: "Montserrat", 
                                      fontWeight:FontWeight.bold,
                                      fontSize:12.0),),
          duration: new Duration(seconds: 5),
        )
    );
  }

  /// Sends the code to the specified phone number.
  Future<void> _sendCodeToPhoneNumber() async {
    print('inside sendCodeToPhoneNumber:');
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential credential){

      FirebaseAuth.instance.signInWithCredential(credential).then((user){
      otpAuthenticated = true;
          mobileNumber = mobile;
          // firebaseId = user.uid.toString();

      FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(firebaseId)
          .child('fcmToken')
          .set({'fcmToken':firebaseId}).then((snapshot) =>{
        print('FCM Token written to user details in Firebase')
      }).catchError((error)=>{
        print('Failed to write FCM Token to user details in Firebase')
      });

      print('Moile number authenticated!!');
      FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(firebaseId)
          .child('customerDetails')
          .once().then((snapshot) {
        if (snapshot.value != null) {
          print('CUSTOMER DETAILS NODE AVAILABLE');
          print('CHECKING IF ADDRESS(S) AVAILABLE');
          FirebaseDatabase.instance
              .reference()
              .child('users')
              .child(user.uid)
              .child('customerDetails')
              .child('addresses')
              .once().then((snapshot) {
            if(snapshot.value!= null)
            {
              print('CUSTOMER DETAILS/ADDRESSES NODE AVAILABLE');
              customerDetailsAvailable = true;

              FirebaseDatabase.instance
                  .reference()
                  .child('users')
                  .child(firebaseId)
                  .child('fcmToken')
                  .set({'fcmToken':firebaseId}).then((snapshot) =>{
                print('FCM Token written to user details in Firebase')
              }).catchError((error)=>{
                print('Failed to write FCM Token to user details in Firebase')
              });
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ShippingAddressSelection();
              }));
            }
            else{
              print('ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
              print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RequestCustomerDetails();
              }));
            }
          });
        }
        else {
          print('ERROR/PROBLEM: CUSTOMER DETAILS/ADDRESSES NODE NOT AVAILABLE');
          print('PROMPTING USER TO PROVIDE ADDRESS DETAILS');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RequestCustomerDetails();
          }));
        }
      });

      });

      setState(() {
        print('Inside _sendCodeToPhoneNumber: signInWithPhoneNumber auto succeeded: $credential');
      });
    };

    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
      print('verfication failed');
      setState(() {
        print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');}
      );
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      print('Verification Id is:' + verificationId.toString());

      print("code sent to (+91)" + mobile);
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
      print("time out");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91'+ mobile,
        timeout: const Duration(seconds: 30),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

        print('codesenttophonenumber:process completed');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldKey,
      appBar: new AppBar(
        title: new Text('LOGIN',  
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontFamily: "Montserrat", 
                                      fontWeight:FontWeight.bold,
                                      fontSize:12.0
                                      ),
                                    textAlign: TextAlign.center,
                                    ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color:Colors.white.withOpacity(0.4),
                elevation: 0.0,
                child:Padding(
                  padding:const EdgeInsets.only(left:12.0),
                  child:TextField(
                      style:TextStyle(
                                      color:Colors.black,
                                      fontFamily: "Montserrat", 
                                      fontWeight:FontWeight.bold,
                                      fontSize:14.0),
                    autofocus: true,
                    focusNode: mobileNumberFocusNode,
                    controller: mobileNumberTextController,
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      icon:Icon(Icons.contact_phone),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

              ),
            ),
           Padding(
              padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color:Colors.white.withOpacity(0.4),
                elevation: 0.0,
                child:Padding(
                  padding:const EdgeInsets.only(left:12.0),
                  child: FlatButton(
                     child: Text('CONFIRM',  
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontFamily: "Montserrat", 
                                      fontWeight:FontWeight.bold,
                                      fontSize:12.0),), 
                     onPressed: (){
                                    if(mobileNumberTextController.text.length != 10)
                                      {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                              content: Text('Error:10 digits. No Country Code!!',  
                                                        style:TextStyle(
                                                          color:Colors.white,
                                                          fontFamily: "Montserrat", 
                                                          fontWeight:FontWeight.bold,
                                                          fontSize:12.0
                                                          ),
                                                        ),
                                                duration: new Duration(seconds: 30),
                                              )
                                          );
                                      }
                                      else
                                      {
                                        print(mobile);
                                        mobile = mobileNumberTextController.text.toString();
                                        // mobileNumberTextController.clear();
                                        // FocusScope.of(context).requestFocus(smsCodeFocusNode);
                                        _sendCodeToPhoneNumber();
                                        _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content: new Text('OTP SENT. PLEASE CHECK SMS!!',  
                                                          style:TextStyle(
                                                            color:Colors.white,
                                                            fontFamily: "Montserrat", 
                                                            fontWeight:FontWeight.bold,
                                                            fontSize:12.0
                                                          ),
                                                        ),
                                            duration: new Duration(seconds: 5),
                                          )
                                        );
                                      }
                                    },
                   
                                    color: Colors.lightBlue,),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color:Colors.white.withOpacity(0.4),
                elevation: 0.0,
                child:Padding(
                  padding:const EdgeInsets.only(left:12.0),
                  child:TextField(
                      style:TextStyle(
                                      color:Colors.black,
                                      fontFamily: "Montserrat", 
                                      fontWeight:FontWeight.bold,
                                      fontSize:14.0),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    controller: smsCodeTextController,
                    focusNode: smsCodeFocusNode,
                    decoration: InputDecoration(
                      hintText: "Enter OTP here",
                      icon:Icon(Icons.code),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

              ),
            ),
            new FlatButton(
                onPressed: () {
                 _signInWithPhoneNumber(smsCodeTextController.text);
                  },
                child: const Text("SIGN IN", 
                  style:TextStyle(
                          color:Colors.white,
                          fontFamily: "Montserrat", 
                          fontWeight:FontWeight.bold,
                          fontSize:12.0),
                ), color: Colors.lightBlue,)
          ],
        ),
      ),
    );
  }
}
