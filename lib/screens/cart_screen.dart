import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  @override
  Widget build(BuildContext context) {
    double itemHeight = MediaQuery.of(context).size.height / 5;
    double width = MediaQuery.of(context).size.width;
    double totalPrice = 0;
    currentUser.cart.forEach(
            (Order order) {totalPrice+=(order.food.price*order.quantity);});

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart (${currentUser.cart.length})"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) =>Divider(height: 1, color: Colors.grey),
          itemCount: currentUser.cart.length+1,
          itemBuilder: (context, index) {
            if (index<currentUser.cart.length){
              return Container(
                width: width,
                height: itemHeight,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      width: width / 2.85,
                      height: width / 2.85,
                      child: ClipRRect(
                        child: Image(
                          image:
                          AssetImage(currentUser.cart[index].food.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentUser.cart[index].food.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('\$${currentUser.cart[index].food.price}',style: TextStyle(fontWeight: FontWeight.w600),)

                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            currentUser.cart[index].restaurant.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon : Icon(Icons.remove),
                                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        setState(() {
                                          currentUser.cart[index].quantity ==0 ? currentUser.cart[index].quantity = 0 : currentUser.cart[index].quantity--;
                                        });
                                      },
                                    ),
                                    Container(
                                      child: Text('${currentUser.cart[index].quantity}'),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        setState(() {
                                          currentUser.cart[index].quantity ++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '\$${(currentUser.cart[index].food.price)*currentUser.cart[index].quantity}',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            else {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: width,
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('Estimated Delivery Time:'),
                              Text('25 min'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('Total Cost:'),
                              Text('\$${totalPrice.toStringAsFixed(2)}',style: TextStyle(color: Colors.green),),
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    width: width,
                    height: 85,
                    child: Center(
                      child: Text('CHECKOUT',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
