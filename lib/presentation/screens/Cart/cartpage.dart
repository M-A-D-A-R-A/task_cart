import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_cart/data/models/model.dart';
import 'package:task_cart/presentation/screens/Cart/widgets/clipper.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartDeatils> _lists = [
    CartDeatils(
        name: 'Breezy Shirt',
        brand: 'House of Rare',
        price: 2300,
        size: 'XXL',
        discount: 0,
        imgLoc: 'assets/images/boy.png',
        list: false,
        cart: true),
    CartDeatils(
        name: 'Breezy Shirt',
        brand: 'House of Rare',
        price: 2300,
        size: 'XXL',
        discount: 0,
        imgLoc: 'assets/images/trouser.jpg',
        list: false,
        cart: true),
    CartDeatils(
        name: 'Breezy Shirt',
        brand: 'House of Rare',
        price: 2300,
        size: 'XXL',
        discount: 0,
        imgLoc: 'assets/images/shoes.jpg',
        list: false,
        cart: true),
  ];

  double _finalSum = 0;

  _listcardWidget(widget) {
    double _discPrice = widget.price - (widget.discount / 100) * widget.price;
    setState(() {
      _finalSum += _discPrice;
    });

    return widget.cart
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.only(left: 90, right: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\u{20B9}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        _discPrice.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.brand,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Text(
                                    "20% off",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 12,
                                    ),
                                  ),
                                  widget.discount != 0
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '\u{20B9}',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 8,
                                              ),
                                            ),
                                            Text(
                                              widget.pPrice.toString(),
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              widget.discount.toString() +
                                                  '% Off',
                                              style: TextStyle(
                                                  color: Colors.orange[400],
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        )
                                      : Row(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.6,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 9,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(500),
                                ),
                                child: Center(
                                  child: Text(
                                    widget.size,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.price = 0.0;
                                        _finalSum = 0.0;
                                        widget.cart = !widget.cart;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.grey[200]),
                                      child: Icon(
                                        CupertinoIcons.bag_fill,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                40,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _finalSum = 0.0;
                                        widget.wishlist = !widget.wishlist;
                                      });
                                    },
                                    child: widget.list
                                        ? Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.red[50],
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Icon(
                                              CupertinoIcons.heart,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40,
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Icon(
                                              CupertinoIcons.heart_fill,
                                              color: Colors.red,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                          ),
                        child: Image.asset(
                          widget.imgLoc,
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container();
  }

  _renderCards() {
    List<Container> finalCards = [];
    _lists.forEach((item) {
      finalCards.add(_listcardWidget(item));
    });
    return finalCards;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                    width: 43,
                    height: 43,
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Anand's Bag",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications_none_outlined,
                        size: 32.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 20, 10),
            child: Text(
              'Items in the Bag',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _renderCards()),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\u{20B9}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      _finalSum.toInt().toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inclusive of taxes',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Breakdown',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(100, 50, 100, 50),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  elevation: 0,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
