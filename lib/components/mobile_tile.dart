import 'package:flutter/material.dart';
import 'package:shopapp/models/mobile_model.dart';

class MobileTile extends StatelessWidget {
  MobileModel mobileModel;
  final bool doRightMargin; // Add this flag to control the right margin
  void Function()? onTap;
  MobileTile(
      {super.key,
      required this.mobileModel,
      required this.doRightMargin,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 35),
      margin: EdgeInsets.only(top: 25, left: 25, right: doRightMargin ? 25 : 0),
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //mobile pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(mobileModel.imagepath),
            ),
          ),
          //name
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(mobileModel.name)),
          //description
          Expanded(
            child: Container(
              height: 5,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    mobileModel.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          //price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  mobileModel.price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //add to cart button
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12))),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
          //button add to cart
        ],
      ),
    );
  }
}
