import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/mobile_tile.dart';
import 'package:shopapp/models/cart_model.dart';
import 'package:shopapp/models/mobile_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
  });
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool doRightMargin(int index) {
    int lastItemIndex =
        Provider.of<CartModel>(context, listen: false).getMobileList().length;
    // Check if the current index is the last in the list
    if (index == lastItemIndex - 1) {
      return true;
    }
    return false;
  }

  //add to cart function
  void addMobileToCart(MobileModel mobile) {
    Provider.of<CartModel>(context, listen: false).addItemToCart(mobile);

    //alert or show the dialog after adding to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(
              '${mobile.name} added Successfully',
              style: TextStyle(fontSize: 18),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok')),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/cart');
                    },
                    child: const Text('Go to Cart'))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Consumer<CartModel>(
          builder: (context, value, child) => Column(
            children: [
              //search bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'search...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide.none, // Remove the default border
                            ),
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.grey),
                        style: const TextStyle(
                          color: Colors.grey,
                          backgroundColor: Colors
                              .transparent, // Ensure the text field itself is transparent
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Check the latest from our app'),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top Trending🔥',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'see all',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.mobile.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        //get the mobile from mobilelist
                        MobileModel mobile = value.getMobileList()[index];

                        return MobileTile(
                            doRightMargin: doRightMargin(index),
                            onTap: () => addMobileToCart(mobile),
                            mobileModel: mobile);
                      }))
            ],
          ),
        ));
  }
}
