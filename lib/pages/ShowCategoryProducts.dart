import 'package:flutter/material.dart';
import 'package:yi/pages/ShowCartProducts.dart';
import 'package:yi/main.dart';
import 'package:firebase_database/firebase_database.dart';


dynamic globalContext;
Map<int, GlobalKey> cardKeys = new Map();
bool qtyupdated = true;
// List<ProductDetails> categoryProducts =
//     categoryProductListMap[categorySelected];

List<ProductDetails> categoryProducts =
    categoryProductListMap[categorySelected];

GlobalKey<_SearchAppBarRecipeState> parentKey;

class CategoryProductsListViewStreamBuilder extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    globalContext = context;

    return MaterialApp(
      title: 'SearchAppBarRecipe',
      home: SeachAppBarRecipe(
        title: 'SearchAppBarRecipe',
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
  static _SearchAppBarRecipeState of(BuildContext context) => context
      .ancestorStateOfType(const TypeMatcher<_SearchAppBarRecipeState>());

  @override
  _SearchAppBarRecipeState createState() => _SearchAppBarRecipeState();
}

class _SearchAppBarRecipeState extends State<SeachAppBarRecipe> {
  _SearchAppBarRecipeState() : super();

  double total = cartTotal;

  _SearchAppBarDelegate _searchDelegate;

  @override
  void initState() {
    super.initState();
    _searchDelegate = _SearchAppBarDelegate(allProducts);
  }

  Widget onTapImage(BuildContext context, String imageUrl) {
    return Center(child: Image.network(imageUrl));
  }

  @override
  Widget build(BuildContext context) {
    parentKey = GlobalKey<_SearchAppBarRecipeState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(globalContext);
          },
        ),
        title: Text(
          categorySelected,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
        actions: <Widget>[
          //Adding the search widget in AppBar
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearchPage(context, _searchDelegate);
            },
          ),
        ],
      ),
      body: Scrollbar(

          //Displaying all English words in list in app's main page
          child: new StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.snapshot.value != null) {
              print('CategoryProductsListViewStreamBuilder:snapshot.data:' +
                  snapshot.data.toString());
              print(snapshot.data);
              print(
                  'CategoryProductsListViewStreamBuilder:snapshot.data.value' +
                      snapshot.data.snapshot.value.toString());
              print(snapshot.data.snapshot.value);
              print(
                  'CategoryProductsListViewStreamBuilder.dart: snapshot.data.value.length:' +
                      snapshot.data.snapshot.value.length.toString());
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              List<dynamic> productListFromEvent = map.values.toList();
              Map<String, ProductDetails> prodCodeProdDetailsMap = new Map();
              categoryProducts = [];
              productListFromEvent.forEach((dynamic values) {
                
                if (values['productcode'].runtimeType.toString() == 'String') {
                  if(values['price'].runtimeType.toString() == 'String')
                  { 
                      categoryProducts.add(ProductDetails(
                        values['title'],
                        double.parse(values['price']),
                        values['productcode'],
                        values['barcode'],
                        values['imageurl']));
                      prodCodeProdDetailsMap[values['productcode']] = new ProductDetails(
                          values['title'],
                          values['price'],
                          values['productcode'],
                          values['barcode'],
                          values['imageurl']);
                  }
                  else
                  {
                    categoryProducts.add(new ProductDetails(
                        values['title'],
                        values['price'],
                        values['productcode'],
                        values['barcode'],
                        values['imageurl']));
                    prodCodeProdDetailsMap[values['productcode']] = new ProductDetails(
                          values['title'],
                          values['price'],
                          values['productcode'],
                          values['barcode'],
                          values['imageurl']);
                  }
                } else 
                {
                if(values['price'].runtimeType.toString() == 'String')
                  {
                      categoryProducts.add(new ProductDetails(
                        values['title'],
                        double.parse(values['price']),
                        values['productcode'].toString(),
                        values['barcode'],
                        values['imageurl']));
                        prodCodeProdDetailsMap[values['productcode'].toString()] = new ProductDetails(
                            values['title'],
                            double.parse(values['price']),
                            values['productcode'].toString(),
                            values['barcode'],
                            values['imageurl']);            
                  }
                  else
                  {
                    categoryProducts.add(new ProductDetails(
                        values['title'],
                        values['price'],
                        values['productcode'].toString(),
                        values['barcode'],
                        values['imageurl']));
                    prodCodeProdDetailsMap[values['productcode'].toString()] = new ProductDetails(
                        values['title'],
                        values['price'],
                        values['productcode'].toString(),
                        values['barcode'],
                        values['imageurl']);
                  }
                }                   
              });

              categoryProducts.sort((a, b) {
                return a.productName
                    .toLowerCase()
                    .compareTo(b.productName.toLowerCase());
              });
              return ListView.builder(
                  itemCount: categoryProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    int qtyInCart = (cartProductMap.containsKey(
                            categoryProducts[index].productID.toString()))
                        ? cartProductMap[categoryProducts[index].productID]
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
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => onTapImage(
                                        context,
                                        categoryProducts[index]
                                            .productImageURL));
                              },
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          categoryProducts[index]
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
                                              color: Colors.black,
                                              fontSize: 14.0)),
                                    ),
                                  ]),
                                )
                              ]),
                            ),
                          ),
                          Expanded(
                              flex: 6,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    categoryProducts[index]
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
                                        categoryProducts[index]
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
                                          categoryProducts[index]
                                              .productID
                                              .toString())) {
                                        print(
                                            "Product already in Cart, so Updating....");
                                        cartProduct = cartProductMap[
                                            categoryProducts[index].productID];
                                        cartProduct.qtyInCart =
                                            cartProduct.qtyInCart + 1;
                                        itemCount = itemCount + 1;
                                        cartTotal = cartTotal +
                                            cartProduct.productPrice;
                                        cartProductMap[categoryProducts[index]
                                            .productID] = cartProduct;
                                        setState(() {
                                          qtyInCart = cartProduct.qtyInCart + 1;
                                        });
                                      } else {
                                        print(
                                            "Produced Not in Cart, So Adding...");
                                        setState(() {
                                          qtyInCart = 1;
                                        });
                                        productCount = productCount + 1;
                                        itemCount = itemCount + 1;
                                        cartProduct = new CartProduct(
                                            categoryProducts[index]
                                                .productName
                                                .toString(),
                                            categoryProducts[index].productID,
                                            categoryProducts[index]
                                                .productBarCode
                                                .toString(),
                                            categoryProducts[index]
                                                .productPrice,
                                            categoryProducts[index]
                                                .productImageURL,
                                            1);
                                        cartTotal = cartTotal +
                                            cartProduct.productPrice;
                                        cartProductMap[categoryProducts[index]
                                            .productID
                                            .toString()] = cartProduct;
                                      }
                                      cartProducts.clear();
                                      for (int i = 0;
                                          i < cartProductMap.length;
                                          i++) {
                                        cartProducts.add(
                                            cartProductMap.values.elementAt(i));
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
                                  child: Text(" ",
                                      style: TextStyle(color: Colors.black)),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    child: new Icon(Icons.remove),
                                    onTap: () {
                                      CartProduct cartProduct;
                                      if (cartProductMap.containsKey(
                                          categoryProducts[index]
                                              .productID
                                              .toString())) {
                                        print(
                                            "Product already in Cart, so Updating....");
                                        cartProduct = cartProductMap[
                                            categoryProducts[index].productID];
                                        cartProduct.qtyInCart =
                                            cartProduct.qtyInCart - 1;
                                        itemCount = itemCount - 1;
                                        cartTotal = cartTotal -
                                            cartProduct.productPrice;
                                        if (cartProduct.qtyInCart == 0) {
                                          productCount = productCount - 1;
                                          cartProductMap.remove(
                                              categoryProducts[index]
                                                  .productID
                                                  .toString());
                                        } else {
                                          cartProductMap[categoryProducts[index]
                                              .productID] = cartProduct;
                                        }
                                        setState(() {
                                          qtyInCart = cartProduct.qtyInCart - 1;
                                        });
                                      }
                                      cartProducts.clear();
                                      for (int i = 0;
                                          i < cartProductMap.length;
                                          i++) {
                                        cartProducts.add(
                                            cartProductMap.values.elementAt(i));
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
              // } else {
              //   return Center(
              //       child: Text(
              //     "COMING SOON!!",
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontFamily: "Montserrat",
              //         fontSize: 12.0,
              //         fontWeight: FontWeight.bold),
              //   ));
              // }
            } else {
              return Center(
                  child: Text(
                "COMING SOON!!",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ));
            }
          } else
            // return Center(
            //     child: Text(
            //   "COMING SOON!!",
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontFamily: "Montserrat",
            //       fontSize: 12.0,
            //       fontWeight: FontWeight.bold),
            // ));
            return Center(
              child: CircularProgressIndicator(),
            );
        },
        stream: FirebaseDatabase.instance
            .reference()
            .child(productsFirebaseNode)
            .orderByChild('category')
            .equalTo(categorySelected)
            .onValue,
      )),
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
              if (cartTotal > 0)
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShowCartProducts();
                }));
              break;
            case 0:
              if (cartTotal > 0)
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShowCartProducts();
                }));
              break;
          }
        },
      ),
    );
  }

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
    print('Call to buildSuggestions');
    print(categoryProductNameMap[categorySelected]);
    print(categorySelected);
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : categoryProductNameMap[categorySelected].keys.where((word) =>
            categoryProductNameMap[categorySelected][word]
                .productName
                .contains(query.toUpperCase()));
    print("buildSuggestions: Suggestions here:");

    print(suggestions);

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

    return Scaffold(
        body: ListView.builder(
            itemCount: widget.suggestions.length,
            itemBuilder: (BuildContext context, int index) {
              int qtyInCart = (cartProductMap.containsKey(
                      categoryProductNameMap[categorySelected]
                              [widget.suggestions[index]]
                          .productID
                          .toString()))
                  ? cartProductMap[categoryProductNameMap[categorySelected]
                              [widget.suggestions[index]]
                          .productID]
                      .qtyInCart
                  : 0;

              print(widget.suggestions[index]);
              print(categoryProductNameMap[categorySelected]
                      [widget.suggestions[index]]
                  .productName);
              print(categoryProductNameMap[categorySelected]
                      [widget.suggestions[index]]
                  .productPrice);
              print(categoryProductNameMap[categorySelected]
                      [widget.suggestions[index]]
                  .productImageURL);

              return Container(
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: Colors.blueGrey)),
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
                                  categoryProductNameMap[categorySelected]
                                          [widget.suggestions[index]]
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
                              categoryProductNameMap[categorySelected]
                                      [widget.suggestions[index]]
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
                                  categoryProductNameMap[categorySelected]
                                          [widget.suggestions[index]]
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
                                    categoryProductNameMap[categorySelected]
                                            [widget.suggestions[index]]
                                        .productID
                                        .toString())) {
                                  print(
                                      "Product already in Cart, so Updating....");
                                  cartProduct = cartProductMap[
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
                                          .productID];
                                  cartProduct.qtyInCart =
                                      cartProduct.qtyInCart + 1;
                                  itemCount = itemCount + 1;
                                  cartTotal =
                                      cartTotal + cartProduct.productPrice;
                                  cartProductMap[
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
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
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
                                          .productName
                                          .toString(),
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
                                          .productID,
                                      categoryProducts[index]
                                          .productBarCode
                                          .toString(),
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
                                          .productPrice,
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
                                          .productImageURL,
                                      1);
                                  cartTotal =
                                      cartTotal + cartProduct.productPrice;
                                  cartProductMap[
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
                                          .productID
                                          .toString()] = cartProduct;
                                }
                                cartProducts.clear();
                                for (int i = 0;
                                    i < cartProductMap.length;
                                    i++) {
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
                            child: Text(" ",
                                style: TextStyle(color: Colors.black)),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              child: new Icon(Icons.remove),
                              onTap: () {
                                CartProduct cartProduct;
                                if (cartProductMap.containsKey(
                                    categoryProductNameMap[categorySelected]
                                            [widget.suggestions[index]]
                                        .productID
                                        .toString())) {
                                  print(
                                      "Product already in Cart, so Updating....");
                                  cartProduct = cartProductMap[
                                      categoryProductNameMap[categorySelected]
                                              [widget.suggestions[index]]
                                          .productID];
                                  cartProduct.qtyInCart =
                                      cartProduct.qtyInCart - 1;
                                  itemCount = itemCount - 1;
                                  cartTotal =
                                      cartTotal - cartProduct.productPrice;
                                  if (cartProduct.qtyInCart == 0) {
                                    productCount = productCount - 1;
                                    cartProductMap.remove(
                                        categoryProductNameMap[categorySelected]
                                                [widget.suggestions[index]]
                                            .productID
                                            .toString());
                                  } else {
                                    cartProductMap[
                                        categoryProductNameMap[categorySelected]
                                                [widget.suggestions[index]]
                                            .productID] = cartProduct;
                                  }
                                  setState(() {
                                    qtyInCart = cartProduct.qtyInCart - 1;
                                  });
                                }
                                cartProducts.clear();
                                for (int i = 0;
                                    i < cartProductMap.length;
                                    i++) {
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
            }),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ShowCartProducts();
            }));
          },
          label: Text(
            'CART/CHECKOUT: Total: \u20B9' + cartTotal.toString(),
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
        ));
  }
}
