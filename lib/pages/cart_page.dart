import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/cart_model.dart';
import 'package:shopapp/models/mobile_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Consumer<CartModel>(
          builder: (context, value, child) => Column(
            children: [
              Text('My Cart'),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      //get individual item from the cart
                      MobileModel mobile = value.getMobileList()[index];

                      //return mobile
                      return CartItem(
                        mobile: mobile,
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

class CartItem extends StatefulWidget {
  MobileModel mobile;
  CartItem({super.key, required this.mobile});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  removeItemFromCart() {
    Provider.of<CartModel>(context, listen: false)
        .removeItemFromCart(widget.mobile);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.asset(widget.mobile.imagepath),
        title: Text(widget.mobile.name),
        subtitle: Text(widget.mobile.price),
        trailing: IconButton(
            onPressed: () => {removeItemFromCart()}, icon: Icon(Icons.delete)),
      ),
    );
  }
}
