import 'package:flutter/material.dart';
import 'package:shop_app/components/details/product_title_with_image.dart';
import 'package:shop_app/models/Product.dart';

import '../../constants.dart';
import 'add_to_cart.dart';
import 'cart_counter.dart';
import 'color_and_size.dart';
import 'description.dart';
import 'favorite_button.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.33),
                  padding: EdgeInsets.only(
                      top: size.height * 0.17,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      Description(product: product),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CartCounter(),
                          FavoriteButton(),
                        ],
                      ),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
