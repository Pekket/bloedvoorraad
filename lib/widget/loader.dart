import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

class Loader extends StatelessWidget {
  final double _height;

  const Loader(this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: EdgeInsets.all(80.0),
      child: Center(
        child: Image.asset(
          Constants.LOADING_IMAGE,
        ),
      ),
    );
  }
}
