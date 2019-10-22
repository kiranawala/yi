import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:yi/main.dart';
import 'package:yi/pages/ShowAllCategories.dart';
// import 'package:yi/pages/ShowCartProducts.dart';
// import 'package:yi/pages/storeDetails.dart';
// import 'package:yi/pages/customerDetailsFutureBuilder.dart';
// import 'package:yi/pages/ShowOrders.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:yi/model/message.dart';
// import 'package:yi/local_notications_helper.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';


const PLAY_STORE_URL =
    'https://play.google.com/store/apps/details?id=com.theminisupermarket.theminisupermarket';

double currentVersion = 0.0;
double newVersion = 0.0;

double currentBuildNumber = 0.0;
double newBuildNumber = 0.0;

 void versionCheck(BuildContext context) async {
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

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void showVersionDialog(BuildContext context) async {
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
      home: HomePageListViewSearch(),
    ));

class HomePageListViewSearch extends StatelessWidget {
  HomePageListViewSearch();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    print("Product Count : " + allProducts.length.toString());
    return MaterialApp(
      title: 'GROCERY CART',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: SeachAppBarRecipe(
        title: 'GROCERY CART',
      ),
    );
  }
}

class SeachAppBarRecipe extends StatefulWidget {
  SeachAppBarRecipe({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _SearchAppBarRecipeState createState() => _SearchAppBarRecipeState();
}

class _SearchAppBarRecipeState extends State<SeachAppBarRecipe> {
  _SearchAppBarRecipeState() : super();

  // final notifications = FlutterLocalNotificationsPlugin();
  _SearchAppBarDelegate _searchDelegate;
  // String textValue = 'Hello World';
  final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  // final List<NotificationMessage> messages = [];
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // try {
    //   versionCheck(context);
    // } catch (e) {
    //   print(e);
    // }
    super.initState();
    print('Getting FCM Token');
    firebaseMessaging.getToken().then((token) {
      firebaseId = token;
      print("FCM TOKEN RETRIEVED:" + token);
    }).catchError((dynamic error) {
      print("FCM Token Retrieval failed. Orders cannot be placed at this time");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "SYSTEM DOWN",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              content: Text("NETWORK ISSUE. PLEASE TRY LATER"),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            );
          });
    });

    // final settingsAndroid = AndroidInitializationSettings('ic_launcher');
    // final settingsIOS = IOSInitializationSettings(
    //     onDidReceiveLocalNotification: (id, title, body, payload) =>
    //         onSelectNotification(payload));

    // notifications.initialize(
    //     InitializationSettings(settingsAndroid, settingsIOS),
    //     onSelectNotification: onSelectNotification); 

    // firebaseMessaging.configure(
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> msg) async {
    //     print(" onResume called ${(msg)}");
    //     print(msg);
    //   },
    //   onMessage: (Map<String, dynamic> message) async {
    //     final notification = message['notification'];
    //     showIconNotification(
    //       context,
    //       notifications,
    //       icon: Image.asset('images/app-logo.png'),
    //       title: notification['title'],
    //       body: notification['body'],
    //       id: 40,
    //     );
    //   },
    // );
    // firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, alert: true, badge: true));
    // firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings setting) {
    //   print('IOS Setting Registed');
    // });

    _searchDelegate = _SearchAppBarDelegate(allProducts);
  }

  // Future onSelectNotification(String payload) async =>
  //     await Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (BuildContext context) {
  //       HomePageListViewSearch();
  //     }));

  // void showNotification(Map<String, dynamic> msg) async {
  //   var android = new AndroidNotificationDetails(
  //     'sdffds dsffds',
  //     "CHANNLE NAME",
  //     "channelDescription",
  //   );
  //   var iOS = new IOSNotificationDetails();
  //   var platform = new NotificationDetails(android, iOS);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, msg['notification']['title'], msg['notification']['body'], platform);
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
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

        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearchPage(context, _searchDelegate);
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          //  InkWell(
          //   onTap: () {
          //   },
          //   child: ListTile(
          //     title: Text('Sign Out'),
          //     leading: Icon(Icons.person, color: Colors.green),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => HomePageListViewSearch()));
          //   },
          //   child: ListTile(
          //     title: Text('Home Page'),
          //     leading: Icon(Icons.home, color: Colors.green),
          //   ),
          // ),
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
          // Divider(),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => new Cart()));
          //   },
          //   child: ListTile(
          //     title: Text('Shopping Cart'),
          //     leading: Icon(Icons.shopping_cart, color: Colors.green),
          //   ),
          // ),
          // InkWell(
          //   child: ListTile(
          //     title: Text('Categories'),
          //     leading: Icon(Icons.favorite, color: Colors.green),
          //   ),
          // ),
          // Divider(),
          // InkWell(
          //   onTap: () {},
          //   child: ListTile(
          //     title: Text('Settings'),
          //     leading: Icon(Icons.settings, color: Colors.green),
          //   ),
          // ),
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
          )
        ]),
      ),
      body: new Column(
          children: <Widget>[                     
            Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment.centerLeft,
          child: new Text(
            'CATEGORIES',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 12.0),
          )),
            ),
             Container(
      child:ShowAllCategories(),
        ),
          ],
        ),
bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: [
         
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: Colors.white),
            title: Text(
              'Products:' + productCount.toString() + '\n' + 
              'Items:' + itemCount.toString(),
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
            title: Text('Rs. '+
              cartTotal.toString() +'/-' +'\n'+
              'CHECKOUT',
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
            // if(cartTotal > 0)
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return ShowCartProducts();
            //   }));
              break;
            case 0:
              // if(cartTotal > 0)
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return ShowCartProducts();
              // }));
              break;
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return HomePageListViewSearch();
              // }));
          }
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return ShowCartProducts();
      //       }));
      //     },
      //     label: Text(
      //       'CART/CHECKOUT: Total: \u20B9' + cartTotal.toString(),
      //       style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: "Montserrat",
      //           fontWeight: FontWeight.bold,
      //           fontSize: 14.0),
      //     )),
    );
  }

  // Widget buildMessage(NotificationMessage message) =>
  //     ListTile(title: Text(message.title), subtitle: Text(message.body));

  void showSearchPage(
      BuildContext context, _SearchAppBarDelegate searchDelegate) async {
    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Your Word Choice: $selected'),
        ),
      );
    }
  }
}

//Search delegate
class _SearchAppBarDelegate extends SearchDelegate<String> {
  final List<ProductDetails> _words;
  final List<String> _history;

  _SearchAppBarDelegate(List<ProductDetails> words)
      : _words = words,
        //pre-populated history of words
        _history = [],
        super();

  // Setting leading icon for the search bar.
  //Clicking on back arrow will take control to main page
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
  }

  // Builds page to populate search results.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('===Your Word Choice==='),
            GestureDetector(
              onTap: () {
                //Define your action when clicking on result item.
                //In this example, it simply closes the page
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing search query - this.query.
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : productMap.keys.where((word) =>
            productMap[word].productName.contains(query.toUpperCase()));

    return productSuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          this.close(context, null);
        },
      )
    ];
  }
}

class productSuggestionList extends StatefulWidget {
  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;
  productSuggestionList({this.suggestions, this.query, this.onSelected})
      : super() {
    print("gay");
    print(this.suggestions.length);
    print(this.suggestions);
  }
  @override
  _productSuggestionListState createState() => _productSuggestionListState(
      suggestions: suggestions, query: query, onSelected: onSelected);
}

class _productSuggestionListState extends State<productSuggestionList> {
  _productSuggestionListState({this.suggestions, this.query, this.onSelected})
      : super() {
    print("hello world!!");
  }
  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    print('suggestions length is' + widget.suggestions.length.toString());
    print('query here is :' + widget.query);
    print('product map length:' + productMap.length.toString());

    return ListView.builder(
        itemCount: widget.suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          int qtyInCart = (cartProductMap.containsKey(
                  productMap[widget.suggestions[index]].productID.toString()))
              ? cartProductMap[productMap[widget.suggestions[index]].productID]
                  .qtyInCart
              : 0;

          return Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(color: Colors.blueGrey[100])),
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              productMap[widget.suggestions[index]]
                                  .productImageURL),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Stack(children: <Widget>[
                        Positioned(
                            left: 0.0,
                            bottom: 0.0,
                            child: Icon(Icons.shopping_cart,
                                color: Colors.lightBlueAccent)),
                        Positioned(
                          left: 6.0,
                          bottom: 6.0,
                          child: Text(qtyInCart.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0)),
                        ),
                      ]),
                    )
                  ]),
                ),
                Expanded(
                    flex: 6,
                    child: Column(
                      children: <Widget>[
                        Text(
                          productMap[widget.suggestions[index]]
                              .productName
                              .toUpperCase(),
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat"),
                        ),
                        Text(
                          "\u20B9 " +
                              productMap[widget.suggestions[index]]
                                  .productPrice
                                  .toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(children: [
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          child: new Icon(Icons.add),
                          onTap: () {
                            CartProduct cartProduct;
                            if (cartProductMap.containsKey(
                                productMap[widget.suggestions[index]]
                                    .productID
                                    .toString())) {
                              print("Product already in Cart, so Updating....");
                              cartProduct = cartProductMap[
                                  productMap[widget.suggestions[index]]
                                      .productID];
                              cartProduct.qtyInCart = cartProduct.qtyInCart + 1;
                              itemCount = itemCount + 1;
                              cartTotal = cartTotal + cartProduct.productPrice;
                              cartProductMap[
                                  productMap[widget.suggestions[index]]
                                      .productID] = cartProduct;
                              setState(() {
                                qtyInCart = cartProduct.qtyInCart + 1;
                              });
                            } else {
                              print("Produced Not in Cart, So Adding...");
                              setState(() {
                                qtyInCart = 1;
                              });
                              productCount = productCount + 1;
                              itemCount = itemCount + 1;
                              cartProduct = new CartProduct(
                                  productMap[widget.suggestions[index]]
                                      .productName
                                      .toString(),
                                  productMap[widget.suggestions[index]]
                                      .productID,
                                  productMap[widget.suggestions[index]]
                                      .productBarCode
                                      .toString(),
                                  productMap[widget.suggestions[index]]
                                      .productPrice,
                                  productMap[widget.suggestions[index]]
                                      .productImageURL,
                                  1);
                              cartTotal = cartTotal + cartProduct.productPrice;
                              cartProductMap[
                                  productMap[widget.suggestions[index]]
                                      .productID
                                      .toString()] = cartProduct;
                            }
                            cartProducts.clear();
                            for (int i = 0; i < cartProductMap.length; i++) {
                              cartProducts
                                  .add(cartProductMap.values.elementAt(i));
                              print(cartProductMap.values
                                  .elementAt(i)
                                  .productName);
                              print(cartProductMap.values
                                  .elementAt(i)
                                  .productPrice);
                              print(cartProductMap.keys.elementAt(i));
                            }
                          },
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(" ", style: TextStyle(color: Colors.black)),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          child: new Icon(Icons.remove),
                          onTap: () {
                            CartProduct cartProduct;
                            if (cartProductMap.containsKey(
                                productMap[widget.suggestions[index]]
                                    .productID
                                    .toString())) {
                              print("Product already in Cart, so Updating....");
                              cartProduct = cartProductMap[
                                  productMap[widget.suggestions[index]]
                                      .productID];
                              cartProduct.qtyInCart = cartProduct.qtyInCart - 1;
                              itemCount = itemCount - 1;
                              cartTotal = cartTotal - cartProduct.productPrice;
                              if (cartProduct.qtyInCart == 0) {
                                productCount = productCount - 1;
                                cartProductMap.remove(
                                    productMap[widget.suggestions[index]]
                                        .productID
                                        .toString());
                              } else {
                                cartProductMap[
                                    productMap[widget.suggestions[index]]
                                        .productID] = cartProduct;
                              }
                              setState(() {
                                qtyInCart = cartProduct.qtyInCart - 1;
                              });
                            }
                            cartProducts.clear();
                            for (int i = 0; i < cartProductMap.length; i++) {
                              cartProducts
                                  .add(cartProductMap.values.elementAt(i));
                              print(cartProductMap.values
                                  .elementAt(i)
                                  .productName);
                              print(cartProductMap.values
                                  .elementAt(i)
                                  .productPrice);
                              print(cartProductMap.keys.elementAt(i));
                            }
                          },
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
