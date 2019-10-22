import 'package:flutter/material.dart';
import 'package:yi/pages/Home.dart';

class OrderConfirmation extends StatefulWidget {
  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldKey,
      appBar: new AppBar(
        title: new Text('ORDER CONFIRMATION',
        style:TextStyle(
          color:Colors.white, 
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold, 
          fontSize: 14.0
          ),
        ),        
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ORDER RECEIVED. THANK YOU.',
                    style:TextStyle(color:Colors.black, fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 12.0)),
                    SizedBox(height:5.0),
            Text('STORE CONTACT: 9059116688',
                    style:TextStyle(color:Colors.black, fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 12.0)),
                    SizedBox(height:20.0),
            Text('SIT BACK AND RELAX!!',
                  style:TextStyle(color:Colors.black, fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 12.0)),
                    SizedBox(height:20.0),
            Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0),
                        child: RaisedButton(
                          onPressed: () {
                                   Navigator.push(context, 
                                    MaterialPageRoute(builder: (context){
                                          return HomePageListViewSearch();
                                      }
                                    )
                                  );
                                },
                          child: Text(
                            'GO BACK TO SHOP',  
                            style:TextStyle(
                              color:Colors.black,
                              fontFamily: "Montserrat", 
                              fontWeight:FontWeight.bold,
                              fontSize:12.0),),
                          color: Colors.lightBlueAccent,
                          textColor: Colors.black,
                        )
                    ),
                    SizedBox(height: 5.0,),


            // Padding(
            //   padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
            //   child: Material(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color:Colors.white.withOpacity(0.4),
            //     elevation: 0.0,
            //     child:Padding(
            //       padding:const EdgeInsets.only(left:12.0),
            //       child:Text('THANK YOU.',
            //         style:TextStyle(color:Colors.black, fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 12.0)),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
            //   child: Material(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color:Colors.white.withOpacity(0.4),
            //     elevation: 0.0,
            //     child:Padding(
            //       padding:const EdgeInsets.only(left:12.0),
            //       child:Text('YOUR ORDER IS PLACED.'),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
            //   child: Material(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color:Colors.white.withOpacity(0.4),
            //     elevation: 0.0,
            //     child:Padding(
            //       padding:const EdgeInsets.only(left:12.0),
            //       child: FlatButton(onPressed: (){
            //         Navigator.push(context, MaterialPageRoute(builder: (context){
            //           return HomePage();
            //         }));
            //       },
            //         child: Text('PLACE ANOTHER ORDER?', style:TextStyle(color:Colors.white)), color: Colors.blue,),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
