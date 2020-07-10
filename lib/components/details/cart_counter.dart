import 'package:flutter/material.dart';

import '../../constants.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  Widget _buildOutlineButton({IconData icon, Function onPressed}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildOutlineButton(
          icon: Icons.remove,
          onPressed: () {
            setState(() {
              if (numOfItems > 1) {
                numOfItems--;
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            numOfItems.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        _buildOutlineButton(
          icon: Icons.add,
          onPressed: () {
            setState(() {
              numOfItems++;
            });
          },
        ),
      ],
    );
  }
}
